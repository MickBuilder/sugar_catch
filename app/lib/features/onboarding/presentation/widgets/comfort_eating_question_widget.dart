import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/question_widget.dart';

class ComfortEatingQuestionWidget extends ConsumerWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const ComfortEatingQuestionWidget({
    super.key,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingDataProvider);

    return QuestionWidget(
      question: 'Do you consume processed foods for comfort?',
      options: const [
        'Frequently',
        'Occasionally',
        'Rarely or never',
      ],
      selectedOption: onboardingData.comfortEating,
      progress: 5 / 16,
      onPrevious: onPrevious,
      onOptionSelected: (option) {
        ref.read(onboardingDataProvider.notifier).updateComfortEating(option);
        Future.delayed(const Duration(milliseconds: 300), onNext);
      },
    );
  }
}

