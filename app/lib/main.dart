import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/core/analytics/analytics_service.dart';
import 'package:cleanfood/core/router/app_router.dart';
import 'package:cleanfood/core/services/cache_service.dart';
import 'package:cleanfood/core/services/history_service.dart';
import 'package:cleanfood/core/services/favorites_service.dart';
import 'package:cleanfood/features/onboarding/data/onboarding_service.dart';
import 'package:cleanfood/core/providers/premium_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Environment variables are now securely embedded at compile time via Envied
  log('✅ Environment variables securely loaded via Envied', name: 'Main');
  
  await Hive.initFlutter();

  // Only initialize OnboardingService synchronously (needed for router)
  await OnboardingService.init();

  // Uncomment the line below to force show onboarding on app restart (for testing)
  // await OnboardingService.resetOnboardingStatus();

  runApp(const ProviderScope(child: FleanApp()));
}

class FleanApp extends ConsumerStatefulWidget {
  const FleanApp({super.key});

  @override
  ConsumerState<FleanApp> createState() => _FleanAppState();
}

class _FleanAppState extends ConsumerState<FleanApp> {
  @override
  void initState() {
    super.initState();
    
    // Initialize non-critical services after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeServicesAsync();
    });
    
    // Initialize premium provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(premiumProvider.notifier).initialize();
    });
    
    // Track app opened event with a delay to ensure analytics is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _trackAppOpened();
      });
    });
  }

  Future<void> _initializeServicesAsync() async {
    try {
      await Future.wait([
        CacheService.init(),
        HistoryService.init(),
        FavoritesService.init(),
      ]);
      log('✅ [Main] Non-critical services initialized in background', name: 'Main');
    } catch (e) {
      log('⚠️ [Main] Failed to initialize services in background: $e', name: 'Main');
    }
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
      title: 'Flean',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemGreen,
        brightness: Brightness.light,
      ),
      routerConfig: router,
    );
  }
}
