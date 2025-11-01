import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/question_widget.dart';

class BoredomEatingQuestionWidget extends ConsumerWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const BoredomEatingQuestionWidget({
    super.key,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingDataProvider);

    return QuestionWidget(
      question: 'Do you consume processed foods out of boredom?',
      options: const [
        'Frequently',
        'Occasionally',
        'Rarely or never',
      ],
      selectedOption: onboardingData.boredomEating,
      progress: 9 / 16,
      onPrevious: onPrevious,
      onOptionSelected: (option) {
        ref.read(onboardingDataProvider.notifier).updateBoredomEating(option);
        Future.delayed(const Duration(milliseconds: 300), onNext);
      },
    );
  }
}

