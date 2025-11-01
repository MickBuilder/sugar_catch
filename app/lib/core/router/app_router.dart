import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/home/presentation/screens/home_screen.dart';
import 'package:cleanfood/features/scan/presentation/screens/scan_screen.dart';
import 'package:cleanfood/features/scan/presentation/screens/product_screen.dart';
import 'package:cleanfood/features/history/presentation/screens/history_screen.dart';
import 'package:cleanfood/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
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
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showPaywallBottomSheet(context);
        // When paywall is dismissed, redirect back to onboarding completion
        if (context.mounted) {
          context.go('/onboarding');
        }
      });
    }
    
    return child;
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final hasCompletedOnboarding = ref.watch(hasCompletedOnboardingProvider);
  final hasAccess = ref.watch(premiumAccessProvider);
  
  // Determine initial location based on onboarding and premium status
  String initialLocation;
  if (!hasCompletedOnboarding) {
    initialLocation = '/onboarding';
  } else if (!hasAccess) {
    initialLocation = '/onboarding';
  } else {
    initialLocation = '/home';
  }
  
  return GoRouter(
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
