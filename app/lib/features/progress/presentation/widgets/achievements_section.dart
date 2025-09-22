import 'package:flutter/cupertino.dart';
import 'package:sugar_catch/features/progress/data/progress_models.dart';

class AchievementsSection extends StatelessWidget {
  final List<Achievement> achievements;

  const AchievementsSection({
    super.key,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Achievements',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Achievements List
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              return _buildAchievementCard(achievement);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementCard(Achievement achievement) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Achievement Icon/Image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: achievement.isUnlocked 
                  ? CupertinoColors.systemGreen.withOpacity(0.1)
                  : CupertinoColors.systemGrey5,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: achievement.isUnlocked 
                    ? CupertinoColors.systemGreen
                    : CupertinoColors.separator,
                width: achievement.isUnlocked ? 2 : 0.5,
              ),
            ),
            child: achievement.isUnlocked
                ? _buildAchievementIcon(achievement)
                : _buildLockedIcon(),
          ),
          
          const SizedBox(height: 6),
          
          // Achievement Title
          Text(
            achievement.title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: achievement.isUnlocked 
                  ? CupertinoColors.label
                  : CupertinoColors.systemGrey,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementIcon(Achievement achievement) {
    // Return different icons based on achievement type
    return achievement.type.when(
      sugarFreeWeek: () => const Icon(
        CupertinoIcons.leaf_arrow_circlepath,
        color: CupertinoColors.systemGreen,
        size: 28,
      ),
      itemsScanned: (count) => const Icon(
        CupertinoIcons.qrcode_viewfinder,
        color: CupertinoColors.systemGreen,
        size: 28,
      ),
      streak: (days) => const Icon(
        CupertinoIcons.flame,
        color: CupertinoColors.systemGreen,
        size: 28,
      ),
      lowSugarDay: () => const Icon(
        CupertinoIcons.heart,
        color: CupertinoColors.systemGreen,
        size: 28,
      ),
      goalReached: () => const Icon(
        CupertinoIcons.checkmark_circle,
        color: CupertinoColors.systemGreen,
        size: 28,
      ),
    );
  }

  Widget _buildLockedIcon() {
    return const Icon(
      CupertinoIcons.lock,
      color: CupertinoColors.systemGrey,
      size: 20,
    );
  }
}
