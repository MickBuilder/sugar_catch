import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/core/analytics/analytics_service.dart';
import 'package:sweetr/features/progress/progress_provider.dart';
import 'package:sweetr/features/progress/presentation/widgets/statistics_section.dart';
// import 'package:sweetr/features/progress/presentation/widgets/achievements_section.dart';
import 'package:sweetr/features/progress/presentation/widgets/consumption_graph_section.dart';

class ProgressScreen extends ConsumerStatefulWidget {
  const ProgressScreen({super.key});

  @override
  ConsumerState<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends ConsumerState<ProgressScreen> {
  @override
  void initState() {
    super.initState();
    // Track screen view
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _trackScreenViewed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final progressData = ref.watch(progressNotifierProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: const Text(
          'Progress',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Track feature usage
            _trackFeatureUsed('share_progress');
            // TODO: Implement share functionality
          },
          child: const Icon(
            CupertinoIcons.share,
            color: CupertinoColors.systemGrey,
            size: 24,
          ),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Statistics Section Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withValues(alpha: .05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: StatisticsSection(statistics: progressData.statistics),
            ),
            
            const SizedBox(height: 20),
            
            // Achievements Section Card - Commented out for now
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     color: CupertinoColors.systemBackground,
            //     borderRadius: BorderRadius.circular(16),
            //     boxShadow: [
            //       BoxShadow(
            //         color: CupertinoColors.black.withOpacity(0.05),
            //         blurRadius: 10,
            //         offset: const Offset(0, 2),
            //       ),
            //     ],
            //   ),
            //   child: AchievementsSection(achievements: progressData.achievements),
            // ),
            
            // const SizedBox(height: 20),
            
            // Consumption Graph Section Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withValues(alpha: .05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ConsumptionGraphSection(
                consumptionData: progressData.consumptionData,
                selectedPeriod: progressData.selectedPeriod,
                onPeriodChanged: (period) {
                  ref.read(progressNotifierProvider.notifier).updateSelectedPeriod(period);
                },
              ),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Analytics tracking methods
  Future<void> _trackScreenViewed() async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      
      await analytics.trackScreenViewed('progress', 0, null); // Time spent will be tracked elsewhere
      await analytics.trackFeatureUsed('progress_viewed');
    } catch (e) {
      log('Analytics error: $e', name: 'Progress');
    }
  }

  Future<void> _trackFeatureUsed(String featureName) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackFeatureUsed(featureName);
    } catch (e) {
      log('Analytics error: $e', name: 'Progress');
    }
  }
}