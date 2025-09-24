import 'package:flutter/cupertino.dart';

class OnboardingPageWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onNext;
  final String? ctaText;

  const OnboardingPageWidget({
    super.key,
    required this.child,
    this.onNext,
    this.ctaText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // Main content - non-scrollable, fits within bounds
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: child,
            ),
          ),

          // CTA Button
          if (onNext != null)
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                onPressed: onNext,
                color: CupertinoColors.systemGreen,
                borderRadius: BorderRadius.circular(12),
                child: Text(
                  ctaText ?? 'Continue',
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
