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
          const SizedBox(height: 40),
          
          // Mock screenshot
          Container(
            height: 400,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: CupertinoColors.separator,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  // Mock header
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: CupertinoColors.systemBackground,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey5,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Oatly!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Oat Drink Whole',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Mock health score
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemRed.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: CupertinoColors.systemRed,
                        width: 2,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          '😰',
                          style: TextStyle(fontSize: 32),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '20/100',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.systemRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Mock details
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMetric('Additives', CupertinoColors.systemRed),
                        _buildMetric('Seed oil', CupertinoColors.systemOrange),
                        _buildMetric('No palm oil', CupertinoColors.systemGreen),
                        _buildMetric('13', CupertinoColors.systemGrey),
                      ],
                    ),
                  ),
                ],
              ),
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

  Widget _buildMetric(String label, Color color) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedCheckmarkCircle01,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: CupertinoColors.systemGrey,
          ),
        ),
      ],
    );
  }
}

