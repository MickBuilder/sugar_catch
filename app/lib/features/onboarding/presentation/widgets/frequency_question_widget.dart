import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/question_widget.dart';

class FrequencyQuestionWidget extends ConsumerWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const FrequencyQuestionWidget({
    super.key,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingDataProvider);

    return QuestionWidget(
      question: 'How many days do you eat processed foods per week?',
      options: const [
        '1-2 days',
        '3-5 days',
        '5-7 days',
        'Never',
        'I don\'t know what\'s processed',
      ],
      selectedOption: onboardingData.processedFoodFrequency,
      progress: 6 / 16,
      onPrevious: onPrevious,
      onOptionSelected: (option) {
        ref.read(onboardingDataProvider.notifier).updateProcessedFoodFrequency(option);
        Future.delayed(const Duration(milliseconds: 300), onNext);
      },
    );
  }
}

