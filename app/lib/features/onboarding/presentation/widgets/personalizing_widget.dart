import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';

class PersonalizingWidget extends HookWidget {
  final VoidCallback onNext;

  const PersonalizingWidget({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final currentStep = useState(0);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 800), () {
        currentStep.value = 1;
      });
      Future.delayed(const Duration(milliseconds: 1600), () {
        currentStep.value = 2;
      });
      Future.delayed(const Duration(milliseconds: 2400), () {
        onNext();
      });

      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hang tight, we\'re personalising your app experience.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),
          
          _buildStep('Collecting your answers', currentStep.value >= 0),
          const SizedBox(height: 32),
          _buildStep('Personalizing the app', currentStep.value >= 1),
          const SizedBox(height: 32),
          _buildStep('Finalizing', currentStep.value >= 2),
        ],
      ),
    );
  }

  Widget _buildStep(String title, bool isCompleted) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isCompleted
                  ? CupertinoColors.systemGreen
                  : CupertinoColors.systemGrey,
            ),
          ),
        ),
        const SizedBox(width: 16),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? CupertinoColors.systemGreen
                : CupertinoColors.systemGrey4,
          ),
          child: isCompleted
              ? HugeIcon(
                  icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                  color: CupertinoColors.white,
                  size: 18,
                )
              : null,
        ),
      ],
    );
  }
}

