import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class EducationDiseaseWidget extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const EducationDiseaseWidget({
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
              color: CupertinoColors.systemRed.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedHeartbreak,
              size: 60,
              color: CupertinoColors.systemRed,
            ),
          ),
          const SizedBox(height: 40),
          
          // Title
          const Text(
            'Worried about disease?',
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
                TextSpan(text: 'Processed food creates '),
                TextSpan(
                  text: 'chronic inflammation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' throughout your body, leading to a ',
                ),
                TextSpan(
                  text: 'higher risk',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' of developing diseases such as '),
                TextSpan(
                  text: 'cancer, heart disease and diabetes',
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

