import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class WelcomeScreenWidget extends StatelessWidget {
  final VoidCallback onNext;

  const WelcomeScreenWidget({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Icon/Logo
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.black.withValues(alpha: 0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/icon.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Title
          const Text(
            'Welcome To Flean',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Processed foods are damaging your health, even if you don\'t know it yet. Let\'s fix that.',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: CupertinoColors.systemGrey,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          Flexible(
            child: Container(), // This acts like a spacer but works in scrollable context
          ),

          // Main illustration - Phone mockup with AR overlay
          Container(
            width: 280,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.black.withValues(alpha: 0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/welcome_screen.png',
                width: 280,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Begin Button
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
                    'Begin',
                    style: TextStyle(
                      color: CupertinoColors.white,
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
