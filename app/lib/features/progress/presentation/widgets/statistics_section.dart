import 'package:flutter/cupertino.dart';
import 'package:sweetr/features/progress/data/progress_models.dart';

class StatisticsSection extends StatelessWidget {
  final ProgressStatistics statistics;

  const StatisticsSection({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Statistics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.label,
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // TODO: Navigate to custom report
              },
              child: const Text(
                'Custom Report',
                style: TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Statistics Cards
        Row(
          children: [
            // Current Streak Card
            Expanded(
              child: _buildStatCard(
                icon: CupertinoIcons.leaf_arrow_circlepath,
                title: 'Current Streak',
                value: '${statistics.currentStreak} Days',
                color: CupertinoColors.systemGreen,
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Best Streak Card
            Expanded(
              child: _buildStatCard(
                icon: CupertinoIcons.star,
                title: 'Best Streak',
                value: '${statistics.bestStreak} Days',
                color: CupertinoColors.systemOrange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: .2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: CupertinoColors.systemGrey,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
