import 'package:flutter/material.dart';
import '../../data/models/presentation_response.dart';
import '../../core/failure.dart';
import '../../core/error_handler.dart';
import 'widgets/pdf_viewer_widget.dart';
import 'widgets/pdf_download_handler.dart';

class ResultView extends StatefulWidget {
  final PresentationResponse response;

  const ResultView({super.key, required this.response});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  String? _localPath;
  bool _downloading = true;
  Failure? _error;

  @override
  void initState() {
    super.initState();
    _downloadPdf();
  }

  Future<void> _downloadPdf() async {
    final url = widget.response.pdfUrl ?? widget.response.data?.url;
    if (url == null) {
      setState(() {
        _error = const Failure.validation(
          message: 'No PDF URL provided in response',
        );
        _downloading = false;
      });
      return;
    }

    try {
      final path = await PdfDownloadHandler.downloadPdf(url);
      if (mounted) {
        setState(() {
          _localPath = path;
          _downloading = false;
        });
      }
    } on Failure catch (failure) {
      if (mounted) {
        setState(() {
          _error = failure;
          _downloading = false;
        });
        showFailureToast(failure);
      }
    } catch (e, st) {
      final failure = Failure.fromException(e, st);
      if (mounted) {
        setState(() {
          _error = failure;
          _downloading = false;
        });
        showFailureToast(failure);
      }
    }
  }

  Future<void> _retryDownload() async {
    setState(() {
      _downloading = true;
      _error = null;
    });
    await _downloadPdf();
  }

  Future<void> _saveToDownloads() async {
    if (_localPath == null) return;
    await PdfDownloadHandler.saveWithFilePicker(_localPath!, context);
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.response.pdfUrl ?? widget.response.data?.url;
    if (url == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('No presentation URL found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Presentation'),
        actions: [
          if (_localPath != null)
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: _saveToDownloads,
            ),
        ],
      ),
      body: _downloading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _error!.userMessage,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: _retryDownload,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry Download'),
                        ),
                      ],
                    ),
                  ),
                )
              : _localPath != null
                  ? PdfViewerWidget(filePath: _localPath!)
                  : const Center(child: Text('Failed to load PDF')),
    );
  }
}
