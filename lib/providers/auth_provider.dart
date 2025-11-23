import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/local/storage_service.dart';
import '../data/remote/mongo_database.dart';
import '../data/models/user_model.dart';
import '../core/failure.dart';
import 'package:uuid/uuid.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  throw UnimplementedError('StorageService must be overridden in main');
}

@Riverpod(keepAlive: true)
MongoDatabase mongoDatabase(Ref ref) {
  return MongoDatabase();
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<void> build() async {
    // Initial state is just void, we check status via storage service
  }

  Future<bool> login(String email, String password) async {
    if (!ref.mounted) return false;

    state = const AsyncValue.loading();
    final nextState = await AsyncValue.guard(() async {
      final db = ref.read(mongoDatabaseProvider);
      final user = await db.getUserByEmail(email);

      if (!ref.mounted) {
        throw const Failure.network(message: 'Operation cancelled');
      }

      if (user != null && user.password == password) {
        final storage = ref.read(storageServiceProvider);
        await storage.setLoggedIn(true);
        await storage.setUserEmail(email);
        if (user.accessId != null) {
          await storage.setAccessId(user.accessId!);
        }
        if (!ref.mounted) {
          throw const Failure.network(message: 'Operation cancelled');
        }
        return;
      } else {
        throw const Failure.auth(message: 'Invalid email or password');
      }
    });

    if (ref.mounted) {
      state = nextState;
    }

    return nextState.hasValue;
  }

  Future<bool> signup(String email, String password) async {
    if (!ref.mounted) return false;

    state = const AsyncValue.loading();
    final nextState = await AsyncValue.guard(() async {
      final db = ref.read(mongoDatabaseProvider);
      final existingUser = await db.getUserByEmail(email);

      if (!ref.mounted) {
        throw const Failure.network(message: 'Operation cancelled');
      }

      if (existingUser != null) {
        throw const Failure.validation(
          message:
              'An account with this email already exists. Please login instead.',
        );
      }

      // Use default API credentials for all new users
      const apiEmail = 'abhi.shamith506@gmail.com';
      const apiAccessId = '5273a113-e3a1-4545-9bbb-e642b7d0fb17';

      final newUser = UserModel(
        id: const Uuid().v4(),
        email: email,
        password: password,
        accessId: apiAccessId,
      );

      await db.insertUser(newUser);

      if (!ref.mounted) {
        throw const Failure.network(message: 'Operation cancelled');
      }

      final storage = ref.read(storageServiceProvider);
      await storage.setLoggedIn(true);
      await storage.setUserEmail(apiEmail); // Use API email for API calls
      await storage.setAccessId(apiAccessId); // Use API accessId for API calls

      if (!ref.mounted) {
        throw const Failure.network(message: 'Operation cancelled');
      }
    });

    if (ref.mounted) {
      state = nextState;
    }

    return nextState.hasValue;
  }

  Future<void> logout() async {
    if (!ref.mounted) return;

    state = const AsyncValue.loading();
    final nextState = await AsyncValue.guard(() async {
      final storage = ref.read(storageServiceProvider);
      await storage.clear();

      if (!ref.mounted) {
        throw const Failure.network(message: 'Operation cancelled');
      }
    });

    if (!ref.mounted) return;
    state = nextState;
  }
}
