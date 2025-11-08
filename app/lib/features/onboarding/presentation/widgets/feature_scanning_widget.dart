import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class FeatureScanningWidget extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const FeatureScanningWidget({
    super.key,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final textHeight = 80.0; // Approximate text height
        final spacing = 75.0; // Two SizedBox heights (slightly reduced)
        final buttonHeight = 50.0; // Button height
        final imageMaxHeight = (availableHeight - textHeight - spacing - buttonHeight).clamp(200.0, 450.0);
        
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Uncover hidden dangers by scanning your food',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              
              // Screenshot image - clipped to prevent overflow
              ClipRect(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: imageMaxHeight,
                    maxWidth: double.infinity,
                  ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  'assets/images/scanning_feature.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 400,
                      color: CupertinoColors.systemGrey6,
                      child: const Center(
                        child: Text('Image not found'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(), // This acts like a spacer but works in scrollable context
          ),
          
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
      },
    );
  }

}

