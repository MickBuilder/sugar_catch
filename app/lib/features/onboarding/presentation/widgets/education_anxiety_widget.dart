import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class EducationAnxietyWidget extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const EducationAnxietyWidget({
    super.key,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: CupertinoColors.systemYellow.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Text(
              '😰',
              style: TextStyle(fontSize: 60),
            ),
          ),
          const SizedBox(height: 40),
          
          // Title
          const Text(
            'Feeling Anxious?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          
          // Description
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 17,
                color: CupertinoColors.systemGrey,
                height: 1.5,
              ),
              children: [
                TextSpan(text: 'Processed food '),
                TextSpan(
                  text: 'artificially boosts',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' feel-good brain chemicals like '),
                TextSpan(
                  text: 'dopamine',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' and '),
                TextSpan(
                  text: 'serotonin',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ', eventually leading to an inability to produce these vital mood-boosting chemicals naturally.',
                ),
              ],
            ),
          ),
          const Spacer(),
          
          // Next Button
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: CupertinoColors.systemGreen,
              borderRadius: BorderRadius.circular(12),
              onPressed: onNext,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, size: 20, color: CupertinoColors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


