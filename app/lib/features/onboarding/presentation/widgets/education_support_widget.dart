import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class EducationSupportWidget extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const EducationSupportWidget({
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
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGreen.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedHeartAdd,
              size: 60,
              color: CupertinoColors.systemGreen,
            ),
          ),
          const SizedBox(height: 40),
          
          // Title
          const Text(
            'Don\'t worry, we\'ve got your back.',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          
          // Description
          const Text(
            'Flean helps thousands of people lose weight, feel less anxious, sleep better and feel more energetic by helping you eliminate processed foods from your diet.',
            style: TextStyle(
              fontSize: 17,
              color: CupertinoColors.systemGrey,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
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
                    'See how we\'ll help',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
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

