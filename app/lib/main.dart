import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/core/analytics/analytics_service.dart';
import 'package:sugar_catch/core/router/app_router.dart';
import 'package:sugar_catch/core/services/cache_service.dart';
import 'package:sugar_catch/core/services/history_service.dart';
import 'package:sugar_catch/features/track/data/track_service.dart';
import 'package:sugar_catch/features/onboarding/data/onboarding_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Environment variables are now securely embedded at compile time via Envied
  log('✅ Environment variables securely loaded via Envied', name: 'Main');
  
  await Hive.initFlutter();

  // Initialize services
  await CacheService.init();
  await HistoryService.init();
  await TrackService.init();
  await OnboardingService.init();

  // Uncomment the line below to force show onboarding on app restart (for testing)
  await OnboardingService.resetOnboardingStatus();

  runApp(const ProviderScope(child: SugarCatchApp()));
}

class SugarCatchApp extends ConsumerStatefulWidget {
  const SugarCatchApp({super.key});

  @override
  ConsumerState<SugarCatchApp> createState() => _SugarCatchAppState();
}

class _SugarCatchAppState extends ConsumerState<SugarCatchApp> {
  @override
  void initState() {
    super.initState();
    // Track app opened event with a delay to ensure analytics is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _trackAppOpened();
      });
    });
  }

        Future<void> _trackAppOpened() async {
          try {
            final analytics = await ref.read(analyticsServiceProvider.future);
            await analytics.trackAppOpened(true); // You can determine if it's first time based on your logic
            log('✅ [ANALYTICS] App opened event tracked successfully', name: 'Analytics');
          } catch (e) {
            // Analytics errors shouldn't crash the app
            log('⚠️ [ANALYTICS] App opened tracking failed: $e', name: 'Analytics');
          }
        }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);

    return CupertinoApp.router(
      title: 'Sugar Catch',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemGreen,
        brightness: Brightness.light,
      ),
      routerConfig: router,
    );
  }
}
