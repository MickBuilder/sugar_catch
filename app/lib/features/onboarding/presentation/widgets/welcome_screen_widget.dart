import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/onboarding/onboarding_provider.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

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
          // Character illustration placeholder
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Icon(
              CupertinoIcons.cart,
              size: 50,
              color: CupertinoColors.systemGrey,
            ),
          ),
          const SizedBox(height: 20),

          // Title
          Text(
            currentScreen.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // Subtitle
          Text(
            currentScreen.subtitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              currentScreen.description,
              style: const TextStyle(
                fontSize: 14,

                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          // Visual: Split-screen showing "0g sugar" vs actual content
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CupertinoColors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // "0g sugar" label
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '0g sugar',
                          style: TextStyle(
            
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'What you see',
                        style: TextStyle(
          
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // VS
                const Text(
                  'VS',
                  style: TextStyle(
    
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 16),
                // Actual content
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemRed,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '12g sugar',
                          style: TextStyle(
            
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'What you get',
                        style: TextStyle(
          
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
