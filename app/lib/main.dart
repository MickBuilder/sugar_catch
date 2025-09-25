import 'package:flutter/cupertino.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/core/router/app_router.dart';
import 'package:sugar_catch/core/services/cache_service.dart';
import 'package:sugar_catch/core/services/history_service.dart';
import 'package:sugar_catch/features/track/data/track_service.dart';
import 'package:sugar_catch/features/onboarding/data/onboarding_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Initialize services
  await CacheService.init();
  await HistoryService.init();
  await TrackService.init();
  await OnboardingService.init();

  // Uncomment the line below to force show onboarding on app restart (for testing)
  // await OnboardingService.resetOnboardingStatus();

  runApp(const ProviderScope(child: SugarCatchApp()));
}

class SugarCatchApp extends ConsumerWidget {
  const SugarCatchApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
