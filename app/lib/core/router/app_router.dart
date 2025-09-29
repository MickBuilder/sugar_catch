import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/features/home/presentation/screens/home_screen.dart';
import 'package:sweetr/features/scan/presentation/screens/scan_screen.dart';
import 'package:sweetr/features/scan/presentation/screens/product_screen.dart';
import 'package:sweetr/features/track/presentation/screens/track_screen.dart';
import 'package:sweetr/features/history/presentation/screens/history_screen.dart';
import 'package:sweetr/features/progress/presentation/screens/progress_screen.dart';
import 'package:sweetr/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:sweetr/features/onboarding/onboarding_provider.dart';
import 'package:sweetr/features/premium/presentation/screens/paywall_screen.dart';
import 'package:sweetr/core/providers/premium_provider.dart';
import 'package:sweetr/core/widgets/app_shell.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final hasCompletedOnboarding = ref.watch(hasCompletedOnboardingProvider);
  final hasAccess = ref.watch(premiumAccessProvider);
  
  // Determine initial location based on onboarding and premium status
  String initialLocation;
  if (!hasCompletedOnboarding) {
    initialLocation = '/onboarding';
  } else if (!hasAccess) {
    initialLocation = '/paywall';
  } else {
    initialLocation = '/home';
  }
  
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/track',
            name: 'track',
            builder: (context, state) => const TrackScreen(),
          ),
          GoRoute(
            path: '/history',
            name: 'history',
            builder: (context, state) => const HistoryScreen(),
          ),
          GoRoute(
            path: '/progress',
            name: 'progress',
            builder: (context, state) => const ProgressScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/scan',
        name: 'scan',
        builder: (context, state) => const ScanScreen(),
      ),
      GoRoute(
        path: '/product/:barcode',
        name: 'product',
        builder: (context, state) {
          final barcode = state.pathParameters['barcode']!;
          return ProductScreen(barcode: barcode);
        },
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/paywall',
        name: 'paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
    ],
  );
});
