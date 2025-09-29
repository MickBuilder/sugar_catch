import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/core/services/history_service.dart';
import 'package:sweetr/features/history/presentation/widgets/history_item_widget.dart';
import 'package:sweetr/features/track/track_provider.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentHistory = ref.watch(recentHistoryProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: const Text(
          'History',
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
      child: _buildHistoryContent(recentHistory),
    );
  }

  Widget _buildHistoryContent(List<HistoryItem> history) {
    if (history.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: history.length,
      itemBuilder: (context, index) {
        return HistoryItemWidget(item: history[index]);
      },
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
