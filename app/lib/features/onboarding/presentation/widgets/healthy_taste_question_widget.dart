import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/question_widget.dart';

class HealthyTasteQuestionWidget extends ConsumerWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const HealthyTasteQuestionWidget({
    super.key,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingDataProvider);

    return QuestionWidget(
      question: 'Does \'healthy\' food usually taste quite \'bland\' to you?',
      options: const [
        'Yes',
        'No',
      ],
      selectedOption: onboardingData.healthyFoodTaste,
      progress: 4 / 16,
      onPrevious: onPrevious,
      onOptionSelected: (option) {
        ref.read(onboardingDataProvider.notifier).updateHealthyFoodTaste(option);
        Future.delayed(const Duration(milliseconds: 300), onNext);
      },
    );
  }
}

