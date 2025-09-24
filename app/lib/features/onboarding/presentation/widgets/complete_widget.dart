import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/onboarding/onboarding_provider.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

class CompleteWidget extends ConsumerWidget {
  final VoidCallback? onNext;
  
  const CompleteWidget({super.key, this.onNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = ref.watch(onboardingScreensProvider);
    final currentScreen = screens[6];

    return OnboardingPageWidget(
      onNext: onNext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Celebration icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Icon(
              CupertinoIcons.checkmark_alt,
              size: 60,
              color: CupertinoColors.systemGreen,
            ),
          ),
          const SizedBox(height: 40),

          // Title
          Text(
            currentScreen.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Subtitle
          Text(
            currentScreen.subtitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              currentScreen.description,
              style: const TextStyle(
                fontSize: 16,
                color: CupertinoColors.black,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),

          // Features reminder
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.black.withValues(alpha: .1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildFeature('Scan products', CupertinoIcons.qrcode_viewfinder),
                const SizedBox(height: 16),
                _buildFeature('Track daily intake', CupertinoIcons.chart_bar),
                const SizedBox(height: 16),
                _buildFeature('View progress', CupertinoIcons.graph_circle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String text, IconData icon) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: CupertinoColors.systemGreen,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.checkmark_circle,
          color: CupertinoColors.systemGreen,
          size: 20,
        ),
      ],
    );
  }
}
