import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/home/presentation/screens/home_screen.dart';
import 'package:cleanfood/features/scan/presentation/screens/scan_screen.dart';
import 'package:cleanfood/features/scan/presentation/screens/product_screen.dart';
import 'package:cleanfood/features/history/presentation/screens/history_screen.dart';
import 'package:cleanfood/features/onboarding/presentation/screens/onboarding_page_screen.dart';
import 'package:cleanfood/features/onboarding/core/onboarding_routes.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:cleanfood/features/onboarding/data/onboarding_service.dart';
import 'package:cleanfood/features/premium/presentation/screens/paywall_screen.dart';
import 'package:cleanfood/core/providers/premium_provider.dart';
import 'package:cleanfood/core/widgets/app_shell.dart';

// Wrapper widget that checks premium access and shows paywall as bottom sheet
class PremiumAccessWrapper extends ConsumerWidget {
  final Widget child;
  
  const PremiumAccessWrapper({super.key, required this.child});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasAccess = ref.watch(premiumAccessProvider);
    
    // If user doesn't have access, show paywall as bottom sheet
    if (!hasAccess) {
      final currentRoute = GoRouterState.of(context).uri.path;
      final hasCompletedOnboarding = ref.read(hasCompletedOnboardingProvider);
      
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showPaywallBottomSheet(context);
        // When paywall is dismissed, only redirect if not already on onboarding
        // and if onboarding is completed (to show last page)
        if (context.mounted && !currentRoute.startsWith('/onboarding')) {
          if (hasCompletedOnboarding) {
            context.go(OnboardingRoutes.getStarted);
          } else {
            context.go(OnboardingRoutes.welcome);
          }
        }
      });
    }
    
    return child;
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  // Read onboarding status directly from service to avoid provider dependency
  // This prevents blocking router creation if provider isn't ready
  final hasAccess = ref.watch(premiumAccessProvider);
  final hasCompletedOnboarding = OnboardingService.hasCompletedOnboarding();
  
  // Determine initial location based on onboarding and premium status
  String initialLocation;
  if (!hasCompletedOnboarding) {
    initialLocation = OnboardingRoutes.welcome;
  } else if (!hasAccess) {
    initialLocation = OnboardingRoutes.getStarted;
  } else {
    initialLocation = '/home';
  }
  
  // Use keepAlive to prevent router recreation and optimize performance
  ref.keepAlive();
  
  final router = GoRouter(
    initialLocation: initialLocation,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(
            child: PremiumAccessWrapper(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/history',
            name: 'history',
            builder: (context, state) => const HistoryScreen(),
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
      // Legacy onboarding route - redirect to welcome
      GoRoute(
        path: '/onboarding',
        redirect: (context, state) => OnboardingRoutes.welcome,
      ),
      // Individual onboarding page routes
      GoRoute(
        path: '/onboarding/:page',
        name: 'onboarding-page',
        builder: (context, state) {
          final page = state.pathParameters['page']!;
          return OnboardingPageScreen(page: page);
        },
      ),
      GoRoute(
        path: '/paywall',
        name: 'paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
    ],
  );
  
  return router;
});
