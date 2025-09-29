import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/features/onboarding/onboarding_provider.dart';
import 'package:sweetr/features/onboarding/data/onboarding_models.dart';

class MotivationWidget extends ConsumerWidget {
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  
  const MotivationWidget({super.key, this.onNext, this.onPrevious});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingDataProvider);
    final notifier = ref.read(onboardingDataProvider.notifier);

    return CupertinoPageScaffold(
      backgroundColor:  CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // Navigation header with progress
              Row(
                children: [
                  // Back button
                  if (onPrevious != null)
                    CupertinoButton(
                      onPressed: onPrevious,
                      child: const Icon(
                        CupertinoIcons.back,
                        color: CupertinoColors.black,
                        size: 24,
                      ),
                    ),
                  if (onPrevious != null) const SizedBox(width: 16),

                  // Progress bar
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 1.0, // 100% for motivation screen (2 of 2 survey screens)
                        child: Container(
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGreen,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Main content
              Expanded(
                child: Column(
                  children: [
                    // Title
                    Text(
                      'Why are you reducing sugar?',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.black,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Subtitle
                    Text(
                      'Understanding your motivation helps us personalize your experience.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.systemGrey,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Motivation options in 3x2 grid
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.2,
                        children: [
                          _buildMotivationOption(
                            'Lose weight',
                            CupertinoIcons.lock_shield_fill,
                            SugarMotivation.loseWeight,
                            onboardingData,
                            notifier,
                          ),
                          _buildMotivationOption(
                            'Improve energy',
                            CupertinoIcons.bolt_fill,
                            SugarMotivation.improveEnergy,
                            onboardingData,
                            notifier,
                          ),
                          _buildMotivationOption(
                            'Better skin',
                            CupertinoIcons.smiley,
                            SugarMotivation.betterSkin,
                            onboardingData,
                            notifier,
                          ),
                          _buildMotivationOption(
                            'Prevent diabetes',
                            CupertinoIcons.heart_fill,
                            SugarMotivation.preventDiabetes,
                            onboardingData,
                            notifier,
                          ),
                          _buildMotivationOption(
                            'General health',
                            CupertinoIcons.shield_fill,
                            SugarMotivation.generalHealth,
                            onboardingData,
                            notifier,
                          ),
                          _buildMotivationOption(
                            'Other',
                            CupertinoIcons.ellipsis,
                            SugarMotivation.other,
                            onboardingData,
                            notifier,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // CTA Button
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: onNext,
                  color: CupertinoColors.systemGreen,
                  borderRadius: BorderRadius.circular(12),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationOption(
    String title,
    IconData icon,
    SugarMotivation motivation,
    OnboardingData onboardingData,
    OnboardingNotifier notifier,
  ) {
    final isSelected = onboardingData.motivations.contains(motivation);
    
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        if (isSelected) {
          notifier.removeMotivation(motivation);
        } else {
          notifier.addMotivation(motivation);
          _trackMotivationSelected(notifier, motivation);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF4CAF50) : const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: CupertinoColors.black,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Analytics tracking method
  Future<void> _trackMotivationSelected(OnboardingNotifier notifier, SugarMotivation motivation) async {
    try {
      // Note: We'll track this in the onboarding screen completion instead
      // since we need access to the WidgetRef here
      log('Motivation selected: ${motivation.title}', name: 'Onboarding');
    } catch (e) {
      log('Analytics error: $e', name: 'Onboarding');
    }
  }
}
