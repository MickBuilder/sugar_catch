import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/features/onboarding/onboarding_provider.dart';
import 'package:sweetr/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

class WelcomeScreenWidget extends ConsumerWidget {
  final VoidCallback? onNext;
  
  const WelcomeScreenWidget({super.key, this.onNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = ref.watch(onboardingScreensProvider);
    final currentScreen = screens[0];

    return OnboardingPageWidget(
      onNext: onNext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // App icon at the top
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.black.withValues(alpha: 0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/icon.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Title
          Text(
            currentScreen.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Unlock the truth about your food.',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.systemGrey,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          Flexible(
            child: Container(), // This acts like a spacer but works in scrollable context
          ),

          // Main illustration - Phone mockup with AR overlay
          Container(
            width: 280,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.black.withValues(alpha: 0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/welcome_screen.png',
                width: 280,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
