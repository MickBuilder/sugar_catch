import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/core/analytics/analytics_service.dart';
import 'package:sugar_catch/core/services/history_service.dart';
import 'package:sugar_catch/features/track/track_provider.dart';
import 'package:sugar_catch/features/track/presentation/widgets/daily_log_entry_widget.dart';
import 'package:sugar_catch/features/track/data/track_models.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyData = useState<Map<String, double>>({});

    useEffect(() {
      // Load weekly data
      weeklyData.value = HistoryService.getWeeklySugarData();
      
      // Track screen view
      _trackScreenViewed(ref);
      
      return null;
    }, []);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Track feature usage
            _trackFeatureUsed(ref, 'notifications_bell');
            // TODO: Implement notifications
          },
          child: const Icon(
            CupertinoIcons.bell,
            color: CupertinoColors.systemGrey,
            size: 24,
          ),
        ),
      ),
      child: Column(
        children: [
          // Weekly Snapshot - Fixed at top
          Padding(
            padding: const EdgeInsets.all(16),
            child: _buildWeeklySnapshot(weeklyData.value),
          ),

          
          // Daily Log - Quick overview of today's sugar intake
          Expanded(child: _buildDailyLogOverview()),
        ],
      ),
    );
  }

  Widget _buildWeeklySnapshot(Map<String, double> weeklyData) {
    // Calculate average daily sugar consumption
    final totalSugar = weeklyData.values.fold(0.0, (sum, value) => sum + value);
    final averageDaily = weeklyData.isNotEmpty
        ? totalSugar / weeklyData.length
        : 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CupertinoColors.separator, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Weekly Snapshot',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
              Text(
                'Avg: ${averageDaily.toStringAsFixed(0)}g/day',
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Days of week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['M', 'T', 'W', 'T', 'F', 'S', 'S'].map((day) {
              return Text(
                day,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.systemGrey,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),

          // Weekly chart placeholder
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Weekly Chart\nComing Soon!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDailyLogOverview() {
    return Consumer(
      builder: (context, ref, child) {
        final todaysLog = ref.watch(trackNotifierProvider);
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today\'s Sugar Intake',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.label,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // Track feature usage
                      _trackFeatureUsed(ref, 'track_more_button');
                      // TODO: Navigate to full track screen
                    },
                    child: const Text(
                      'Track More',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.systemGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Content - Takes remaining space
            Expanded(
              child: todaysLog.entries.isEmpty
                  ? _buildEmptyDailyLog()
                  : _buildDailyLogContent(todaysLog, ref),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmptyDailyLog() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CupertinoColors.separator, width: 0.5),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.chart_bar,
              size: 48,
              color: CupertinoColors.systemGrey,
            ),
            SizedBox(height: 16),
            Text(
              'No sugar logged today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.label,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Start tracking your sugar intake\nby adding products to your log',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyLogContent(DailyLog todaysLog, WidgetRef ref) {
    return Column(
      children: [
        // Total sugar summary
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: CupertinoColors.separator, width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Sugar Today:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.label,
                ),
              ),
              Text(
                '${todaysLog.totalSugar.toStringAsFixed(1)}g',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _getSugarColor(todaysLog.totalSugar),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Log entries
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: todaysLog.entries.length,
            itemBuilder: (context, index) {
              final entry = todaysLog.entries[index];
              return DailyLogEntryWidget(
                entry: entry,
                onRemove: () {
                  ref.read(trackNotifierProvider.notifier).removeLogEntry(entry.id);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getSugarColor(double totalSugar) {
    if (totalSugar <= 15) {
      return CupertinoColors.systemGreen;
    } else if (totalSugar <= 30) {
      return CupertinoColors.systemOrange;
    } else {
      return CupertinoColors.systemRed;
    }
  }

  // Analytics tracking methods
  Future<void> _trackScreenViewed(WidgetRef ref) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackScreenViewed('home', 0, null); // Time spent will be tracked elsewhere
    } catch (e) {
      log('Analytics error: $e', name: 'Home');
    }
  }

  Future<void> _trackFeatureUsed(WidgetRef ref, String featureName) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackFeatureUsed(featureName);
    } catch (e) {
      log('Analytics error: $e', name: 'Home');
    }
  }
}
