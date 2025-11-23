import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../../../core/failure.dart';
import '../../../core/logger.dart';
import '../../../core/error_handler.dart';

class PdfDownloadHandler {
  static Future<String?> downloadPdf(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      // Check status code
      if (response.statusCode >= 400) {
        final failure = Failure.fromHttpResponse(
          response.statusCode,
          response.body,
        );
        Logger.logFailure(failure);
        throw failure;
      }

      final dir = await getApplicationDocumentsDirectory();
      final file = File(
        '${dir.path}/presentation_${DateTime.now().millisecondsSinceEpoch}.pdf',
      );
      await file.writeAsBytes(response.bodyBytes);

      Logger.info('PDF downloaded successfully: ${file.path}');
      return file.path;
    } on Failure catch (failure) {
      Logger.logFailure(failure);
      rethrow;
    } catch (e, st) {
      Logger.error('Unexpected error downloading PDF', e, st);
      throw Failure.fromException(e, st);
    }
  }

  /// Opens file picker/saver dialog for user to choose where to save the PDF
  static Future<bool> saveWithFilePicker(
    String localPath,
    BuildContext context,
  ) async {
    try {
      final file = File(localPath);
      if (!await file.exists()) {
        showWarningToast('PDF file not found');
        return false;
      }

      // On mobile platforms, use share sheet (more reliable)
      // On desktop platforms, use file picker
      if (Platform.isAndroid || Platform.isIOS) {
        if (!context.mounted) return false;
        return await _saveViaShareSheet(localPath, context);
      }

      // Desktop platforms: Use file picker
      final fileName =
          'magicslides_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final savedPath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save PDF to...',
        fileName: fileName,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (savedPath != null) {
        await file.copy(savedPath);
        showSuccessToast('PDF saved successfully');
        return true;
      }
      return false;
    } catch (e) {
      // Fallback to share sheet if file picker fails
      if (!context.mounted) return false;
      return await _saveViaShareSheet(localPath, context);
    }
  }

  /// Fallback: Opens share sheet where user can save to Files app
  static Future<bool> _saveViaShareSheet(
    String localPath,
    BuildContext context,
  ) async {
    try {
      final file = File(localPath);
      if (!await file.exists()) {
        showWarningToast('PDF file not found');
        return false;
      }

      final xFile = XFile(localPath);
      final shareResult = await SharePlus.instance.share(
        ShareParams(
          files: [xFile],
          subject: 'MagicSlides Presentation',
          text: 'Save this presentation PDF',
        ),
      );

      // Check if sharing was successful
      if (shareResult.status == ShareResultStatus.success) {
        Logger.info('File shared successfully');
      } else if (shareResult.status == ShareResultStatus.dismissed) {
        Logger.info('Share dialog dismissed');
      } else {
        Logger.warning('Share failed: ${shareResult.status}');
      }

      return true;
    } catch (e) {
      final failure = Failure.fromException(e);
      showFailureToast(failure);
      return false;
    }
  }

  /// Legacy method - kept for backward compatibility
  @Deprecated('Use saveWithFilePicker instead')
  static Future<bool> saveToDownloads(
    String localPath,
    BuildContext context,
  ) async {
    return saveWithFilePicker(localPath, context);
  }
}
