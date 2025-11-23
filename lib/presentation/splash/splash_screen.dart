import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashScreen({super.key, required this.onInitializationComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Show splash with loader for a visible duration, then navigate to actual screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (mounted) {
          widget.onInitializationComplete();
        }
      });
    });
  }

  bool get _isIOS => Platform.isIOS;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Platform-specific background color
    final backgroundColor = colorScheme.surface;

    // Platform-specific logo size
    final logoSize = _isIOS ? 140.0 : 150.0;

    // Platform-specific spacing
    final spacing = _isIOS ? 28.0 : 32.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/magic_slides.png',
                width: logoSize,
                height: logoSize,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback if image fails to load
                  return Icon(
                    Icons.slideshow,
                    size: logoSize,
                    color: colorScheme.primary,
                  );
                },
              ),
              SizedBox(height: spacing),
              // Platform-specific loader
              _buildLoader(context, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context, ColorScheme colorScheme) {
    if (_isIOS) {
      // iOS-style CupertinoActivityIndicator
      return CupertinoActivityIndicator(
        radius: 12.0,
        color: colorScheme.primary,
      );
    } else {
      // Android-style CircularProgressIndicator
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
        strokeWidth: 3.0,
      );
    }
  }
}
