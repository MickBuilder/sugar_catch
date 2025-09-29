import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/features/onboarding/onboarding_provider.dart';
import 'package:sweetr/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

class HiddenSugarProblemWidget extends ConsumerWidget {
  final VoidCallback? onNext;
  
  const HiddenSugarProblemWidget({super.key, this.onNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = ref.watch(onboardingScreensProvider);
    final currentScreen = screens[1];

    return OnboardingPageWidget(
      onNext: onNext,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title - aligned to left like in example
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              currentScreen.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Description - aligned to left like in example
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              currentScreen.description,
              style: const TextStyle(
                fontSize: 16,
                color: CupertinoColors.systemGrey,
                height: 1.4,
              ),
            ),
          ),
          Spacer(),

          // Display the actual image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/onboarding_screen_2.png',
              fit: BoxFit.contain, // Changed from cover to contain to show whole image
              width: double.infinity, // Let it use full width
              errorBuilder: (context, error, stackTrace) {
                // Fallback if image is not found
                return Container(
                  height: 400,
                  color: CupertinoColors.systemGrey5,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.photo,
                          size: 50,
                          color: CupertinoColors.systemGrey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Image not found',
                          style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
