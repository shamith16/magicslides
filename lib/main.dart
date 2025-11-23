import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toastification/toastification.dart';
import 'data/local/storage_service.dart';
import 'providers/auth_provider.dart';
import 'providers/presentation_provider.dart';
import 'providers/loading_message_provider.dart';
import 'core/error_handler.dart';
import 'presentation/auth/login_view.dart';
import 'presentation/home/home_view.dart';
import 'presentation/splash/splash_screen.dart';
import 'presentation/widgets/ai_loading_overlay.dart';
import 'theme/brand_colors.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize global error handler
  GlobalErrorHandler.initialize();

  // Load environment variables
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint('Warning: Could not load .env file: $e');
    debugPrint(
      'Make sure .env file exists with MONGODB_CONNECTION_STRING and MONGODB_DATABASE_NAME',
    );
  }

  final storageService = StorageService();
  await storageService.init();

  // All async tasks are complete in splash, splash will be removed in build method

  runApp(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(storageService)],
      child: const MagicSlidesApp(),
    ),
  );
}

class MagicSlidesApp extends ConsumerStatefulWidget {
  const MagicSlidesApp({super.key});

  @override
  ConsumerState<MagicSlidesApp> createState() => _MagicSlidesAppState();
}

class _MagicSlidesAppState extends ConsumerState<MagicSlidesApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    // Remove native splash screen after Flutter splash screen is shown
    // Delay removal to ensure smooth transition
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        FlutterNativeSplash.remove();
      });
    });
  }

  void _onSplashComplete() {
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = ref.watch(storageServiceProvider);

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: BrandColors.primary,
          brightness: Brightness.light,
        ).copyWith(
          primary: BrandColors.primary,
          onPrimary: BrandColors.onPrimary,
          secondary: BrandColors.secondary,
          onSecondary: BrandColors.onSurface,
          surface: BrandColors.surface,
          onSurface: BrandColors.onSurface,
          error: BrandColors.error,
          outline: BrandColors.outline,
          primaryContainer: BrandColors.primaryDark,
          inversePrimary: BrandColors.primaryDark,
        );

    final theme = ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: BrandColors.background,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: BrandColors.onSurface,
        displayColor: BrandColors.onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: BrandColors.background,
        foregroundColor: BrandColors.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          color: BrandColors.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: BrandColors.primary,
          foregroundColor: BrandColors.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: BrandColors.surface,
        labelStyle: TextStyle(
          color: BrandColors.onSurface.withValues(alpha: 0.7),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: BrandColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: BrandColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: BrandColors.primary, width: 2),
        ),
      ),
      cardColor: BrandColors.surface,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: BrandColors.primary,
        contentTextStyle: TextStyle(color: BrandColors.onPrimary),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    return MaterialApp(
      title: 'magicslides',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: _showSplash
          ? SplashScreen(onInitializationComplete: _onSplashComplete)
          : (storage.isLoggedIn ? const HomeView() : const LoginView()),
      builder: (context, child) {
        final presentationState = ref.watch(presentationProvider);
        final loadingMessage = ref.watch(loadingMessageProvider);
        return AiLoadingOverlay(
          visible: presentationState.isLoading,
          message: loadingMessage,
          child: ToastificationWrapper(child: child ?? const SizedBox.shrink()),
        );
      },
    );
  }
}
