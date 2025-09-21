import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/core/services/history_service.dart';
import 'package:sugar_catch/features/home/presentation/widgets/history_item_widget.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentHistory = useState<List<HistoryItem>>([]);
    final weeklyData = useState<Map<String, double>>({});

    useEffect(() {
      // Load recent history and weekly data
      recentHistory.value = HistoryService.getRecentHistory();
      weeklyData.value = HistoryService.getWeeklySugarData();
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

          // History - Takes remaining space and scrollable
          Expanded(child: _buildRecentlyScanned(recentHistory.value)),
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

  Widget _buildRecentlyScanned(List<HistoryItem> recentHistory) {
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
                'Recently Scanned',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // TODO: Navigate to full history
                },
                child: const Text(
                  'View All',
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
          child: recentHistory.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: recentHistory.length,
                  itemBuilder: (context, index) {
                    return HistoryItemWidget(item: recentHistory[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CupertinoColors.separator, width: 0.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 48,
              color: CupertinoColors.systemGrey,
            ),
            const SizedBox(height: 16),
            const Text(
              'No scans yet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start scanning products to see your history here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemGrey2,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
