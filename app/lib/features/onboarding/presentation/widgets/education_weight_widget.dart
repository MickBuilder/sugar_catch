import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class EducationWeightWidget extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const EducationWeightWidget({
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
              color: CupertinoColors.systemOrange.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedArrowUp01,
              size: 60,
              color: CupertinoColors.systemOrange,
            ),
          ),
          const SizedBox(height: 40),
          
          // Title
          const Text(
            'Gaining weight?',
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
                TextSpan(text: 'Processed food is engineered to drive huge amounts of '),
                TextSpan(
                  text: 'insulin',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '. This is a '),
                TextSpan(
                  text: 'fat storage',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' chemical meaning you gain more weight even though you\'re ',
                ),
                TextSpan(
                  text: 'eating fewer calories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '.'),
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

