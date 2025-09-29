import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/core/analytics/analytics_service.dart';
import 'package:sweetr/features/onboarding/onboarding_provider.dart';
import 'package:sweetr/features/onboarding/data/onboarding_models.dart';

class SugarGoalsWidget extends ConsumerWidget {
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const SugarGoalsWidget({super.key, this.onNext, this.onPrevious});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingDataProvider);
    final notifier = ref.read(onboardingDataProvider.notifier);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
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
                        widthFactor:
                            0.5, // 50% for goals screen (1 of 2 survey screens)
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

              // Main content - non-scrollable
              Expanded(
                child: Column(
                  children: [
                    // Title
                    Text(
                      'What\'s your sugar goal?',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.black,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description
                    Text(
                      'Set a daily sugar limit to start your detox journey.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.systemGrey,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Goal options
                    Column(
                      children: [
                        _buildGoalOption(
                          'Sugar Detox (0-5g daily)',
                          onboardingData.sugarGoal == SugarGoal.detox,
                          () {
                            HapticFeedback.selectionClick();
                            notifier.updateSugarGoal(SugarGoal.detox);
                            _trackGoalSelected(ref, SugarGoal.detox);
                            // Auto-navigate to next screen
                            Future.delayed(
                              const Duration(milliseconds: 300),
                              () {
                                onNext?.call();
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        _buildGoalOption(
                          'Low Sugar (5-15g daily)',
                          onboardingData.sugarGoal == SugarGoal.lowSugar,
                          () {
                            HapticFeedback.selectionClick();
                            notifier.updateSugarGoal(SugarGoal.lowSugar);
                            _trackGoalSelected(ref, SugarGoal.lowSugar);
                            // Auto-navigate to next screen
                            Future.delayed(
                              const Duration(milliseconds: 300),
                              () {
                                onNext?.call();
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        _buildGoalOption(
                          'Moderate (15-25g daily)',
                          onboardingData.sugarGoal == SugarGoal.moderate,
                          () {
                            HapticFeedback.selectionClick();
                            notifier.updateSugarGoal(SugarGoal.moderate);
                            _trackGoalSelected(ref, SugarGoal.moderate);
                            // Auto-navigate to next screen
                            Future.delayed(
                              const Duration(milliseconds: 300),
                              () {
                                onNext?.call();
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        _buildGoalOption(
                          'Just Track (No limit)',
                          onboardingData.sugarGoal == SugarGoal.trackOnly,
                          () {
                            HapticFeedback.selectionClick();
                            notifier.updateSugarGoal(SugarGoal.trackOnly);
                            _trackGoalSelected(ref, SugarGoal.trackOnly);
                            // Auto-navigate to next screen
                            Future.delayed(
                              const Duration(milliseconds: 300),
                              () {
                                onNext?.call();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalOption(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0F8F0) : CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? CupertinoColors.systemGreen
                : const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.black,
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFE0E0E0),
                  width: 2,
                ),
                color: isSelected
                    ? const Color(0xFF4CAF50)
                    : CupertinoColors.white,
              ),
              child: isSelected
                  ? const Icon(
                      CupertinoIcons.checkmark,
                      size: 12,
                      color: CupertinoColors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // Analytics tracking method
  Future<void> _trackGoalSelected(WidgetRef ref, SugarGoal goal) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackOnboardingGoalSelected(goal.title);
    } catch (e) {
      log('Analytics error: $e', name: 'Onboarding');
    }
  }
}
