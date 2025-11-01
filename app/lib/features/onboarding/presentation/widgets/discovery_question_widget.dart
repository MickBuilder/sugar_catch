import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/question_widget.dart';

class DiscoveryQuestionWidget extends ConsumerWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const DiscoveryQuestionWidget({
    super.key,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingDataProvider);

    return QuestionWidget(
      question: 'How did you hear about us?',
      options: const [
        'Instagram',
        'TikTok',
        'Facebook',
        'Word of mouth',
        'Other',
      ],
      selectedOption: onboardingData.discoverySource,
      progress: 3 / 16,
      onPrevious: onPrevious,
      onOptionSelected: (option) {
        ref.read(onboardingDataProvider.notifier).updateDiscoverySource(option);
        Future.delayed(const Duration(milliseconds: 300), onNext);
      },
    );
  }
}

