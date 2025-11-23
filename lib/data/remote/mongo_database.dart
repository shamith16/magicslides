import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection, ObjectId, where;
import '../models/user_model.dart';
import '../../config/mongo_config.dart';
import '../../core/failure.dart';
import '../../core/logger.dart';

class MongoDatabase {
  static String get _connectionString => MongoConfig.connectionString;
  static const String _collectionName = MongoConfig.usersCollectionName;

  Db? _db;
  DbCollection? _usersCollection;

  Future<void> connect() async {
    if (_db != null && _db!.isConnected) return;

    try {
      _db = await Db.create(_connectionString);
      await _db!.open();
      // Explicitly select the database to ensure we're using the correct one
      // The database name is already in the connection string, but this ensures it
      _usersCollection = _db!.collection(_collectionName);
    } catch (e, st) {
      Logger.error('MongoDB connection error', e, st);
      // Check if it's a network-related error
      final errorString = e.toString().toLowerCase();
      if (errorString.contains('connection') || 
          errorString.contains('timeout') ||
          errorString.contains('network') ||
          errorString.contains('socket')) {
        throw Failure.network(
          message: 'Database connection failed. Please check your internet connection.',
        );
      }
      throw Failure.fromException(e, st);
    }
  }

  Future<void> close() async {
    await _db?.close();
  }

  Future<void> insertUser(UserModel user) async {
    await connect();
    try {
      await _usersCollection!.insert(user.toJson());
    } catch (e, st) {
      if (e is Failure) rethrow;
      Logger.error('MongoDB insert error', e, st);
      // Check for duplicate key error (MongoDB error code 11000)
      final errorString = e.toString();
      if (errorString.contains('11000') || 
          errorString.contains('duplicate') ||
          errorString.contains('E11000')) {
        throw const Failure.validation(
          message: 'An account with this email already exists.',
        );
      }
      throw Failure.fromException(e, st);
    }
  }

  Future<UserModel?> getUserByEmail(String email) async {
    await connect();
    try {
      final data = await _usersCollection!.findOne(where.eq('email', email));
      if (data != null) {
        // Ensure id is handled correctly if it's an ObjectId
        if (data['_id'] is ObjectId) {
          data['id'] = (data['_id'] as ObjectId).oid;
          data.remove('_id');
        }
        return UserModel.fromJson(data);
      }
      return null;
    } catch (e, st) {
      if (e is Failure) rethrow;
      Logger.error('MongoDB query error', e, st);
      throw Failure.fromException(e, st);
    }
  }
}
