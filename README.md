# MagicSlides

MagicSlides is a Flutter client that signs users up, persists their sessions, and lets them generate PPT/PDF decks from any topic using the MagicSlides Topic → PPT API. It targets Android first (with iOS/web compatibility in mind) and ships with a production-ready build pipeline plus a signed release APK.

---

## Stack & Architecture

- **Flutter + Riverpod** for state management (`riverpod_annotation`, `async` providers, `ProviderScope` overrides).
- **MongoDB Atlas** (via `mongo_dart`) for persisting user accounts and API credentials; runtime config comes from `.env`.
- **Chopper + Freezed** for strongly typed API clients & models (`PresentationRequest`, `PresentationResponse`, `Watermark`).
- **SharedPreferences storage layer** for session flags and persisted form preferences.
- **UI** built with Material 3, Google Fonts, segmented template selectors, and granular settings sections.
- **Animated UX** provided by `AiLoadingOverlay`, which combines a Lottie asset with a custom `AnimationController` and shader-based border pulses.

---

## Prerequisites

1. Flutter 3.24+ (`flutter --version`).
2. Android Studio or the standalone Android SDK/command-line tools (for `adb`, build-tools, emulators).
3. A reachable MongoDB cluster plus credentials in `.env`:

   ```
   MONGODB_CONNECTION_STRING=mongodb+srv://<user>:<pass>@<cluster>/
   MONGODB_DATABASE_NAME=magicslides
   ```

4. (Optional) Lottie asset already lives at `assets/ai_loading.json`; ensure `flutter pub get` pulls the declared dependencies.

---

## Setup & Running

### 1. Configure Environment

1. Copy the example env file and fill in your cluster details:

   ```bash
   cp .env.example .env
   # edit .env to add real MongoDB credentials
   ```

2. Copy the Mongo config template (real file is git-ignored):

   ```bash
   cp lib/config/mongo_config.example.dart lib/config/mongo_config.dart
   ```

   Update the generated file if you prefer not to rely on `.env` (e.g., you can hardcode a dev-only connection string).

```bash
cd /Users/shamith/Developer/Frontend/magicslides
flutter pub get

# Only needed if you change any freezed/chopper classes
dart run build_runner build --delete-conflicting-outputs

# Debug run
flutter run

# Signed release APK (uses dummy keystore described in android/key.properties)
JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home" \
  flutter build apk --release
```

The latest signed artifact lives at `build/app/outputs/flutter-apk/app-release.apk` and has already been installed on the connected Android device.

---

## Feature Checklist

- [x] Email/password signup & login backed by MongoDB (Atlas or local) with validation and duplicate detection.
- [x] Persistent sessions, splash routing, and logout support driven by `StorageService`.
- [x] Topic input form with default vs editable template selector, catalog dropdown, and helper link to MagicSlides docs.
- [x] Advanced settings: slide count (1–50), language picker, AI images, per-slide images, Google Images, Google Text, GPT-4 / GPT-3.5 model swap, and “presentation for” dropdown.
- [x] Optional watermark configuration (enable toggle, width, height, brand URL, positional dropdown) that validates inputs before calling the API.
- [x] MagicSlides Topic → PPT integration via Chopper with request validation, nested-response flattening, and toast-based error surfacing.
- [x] PDF preview experience powered by `flutter_pdfview`, download/share flow implemented through `share_plus` + file picker abstraction.
- [x] Lottie-powered `AiLoadingOverlay` using an `AnimationController` for glowing borders and motion while slides generate.
- [x] Settings persistence per user (template, slide count, language, toggles, etc.) via `SharedPreferences`.
- [x] Toastification-based feedback for validation, network, and authentication errors plus retry flows for downloads.

---

## Deliverables

- **APK**: [build/app/outputs/flutter-apk/app-release.apk](build/app/outputs/flutter-apk/app-release.apk) (Git LFS managed)
- **Repository**: this project (`magicslides`)
- **Video Demo**: [videos/screen-20251123-144430~2.mp4](videos/screen-20251123-144430~2.mp4) (Git LFS managed)

---

## How Things Work (High Level Flow)

1. User lands on Splash → Login/Signup, backed by MongoDB via `MongoDatabase`.
2. Successful auth stores `isLoggedIn`, `user_email`, `access_id`, and preference defaults in `SharedPreferences`.
3. Home screen (`HomeView`) loads the saved preferences, lets the user tweak template/settings/watermark inputs, and builds a `PresentationRequest`.
4. `PresentationNotifier` sends the request to `/public/api/ppt_from_topic`, converts failures into domain-specific `Failure` types, and streams success to the UI.
5. Result screen downloads the PDF, previews it inline, and allows saving/sharing—all with retry/error surfacing.

---

## Issues Identified / Bugs

- _Add details here as you discover them._

---

## Notes

- Default API email/accessId values are intentionally shared (per the assignment instructions) so candidates can focus on the client implementation without requesting unique credentials; swap them via `StorageService` if individualized keys are provided later.
- The dummy release keystore lives at `android/app/dummy-release.jks` with matching `android/key.properties`. Replace both with production credentials before publishing to a store.
