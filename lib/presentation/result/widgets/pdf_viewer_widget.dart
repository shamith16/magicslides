import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerWidget extends StatefulWidget {
  final String filePath;

  const PdfViewerWidget({super.key, required this.filePath});

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  int? _currentPage;
  int? _totalPages;
  bool _showSwipeHint = true;

  @override
  void initState() {
    super.initState();
    // Hide swipe hint after 3 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          _showSwipeHint = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: ClipRect(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: PDFView(
                filePath: widget.filePath,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: true,
                pageFling: true,
                fitEachPage: true,
                pageSnap: true,
                defaultPage: 0,
                fitPolicy: FitPolicy.WIDTH,
                onPageChanged: (int? page, int? total) {
                  if (mounted) {
                    setState(() {
                      _currentPage = page;
                      _totalPages = total;
                      // Hide hint once user starts navigating
                      if (page != null && page > 0) {
                        _showSwipeHint = false;
                      }
                    });
                  }
                },
                onRender: (int? pages) {
                  if (mounted) {
                    setState(() {
                      _totalPages = pages;
                    });
                  }
                },
              ),
            ),
          ),
        ),
        // Page indicator
        if (_currentPage != null && _totalPages != null)
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Page ${_currentPage! + 1} of $_totalPages',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        // Swipe hint
        if (_showSwipeHint)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _showSwipeHint ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.swipe_down, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Swipe down for next page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
