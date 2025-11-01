import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/core/analytics/analytics_service.dart';
import 'package:cleanfood/core/services/history_service.dart';
import 'package:cleanfood/features/history/presentation/widgets/history_item_widget.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentScans = useState<List<HistoryItem>>([]);

    useEffect(() {
      // Load recent scans
      recentScans.value = HistoryService.getRecentHistory(limit: 5);
      
      // Track screen view
      _trackScreenViewed(ref);
      
      return null;
    }, []);

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background matching design
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
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedNotification01,
            color: CupertinoColors.systemGrey,
            size: 24,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Welcome Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildWelcomeCard(context),
            ),

            // Recent Scans Section
            Expanded(
              child: _buildRecentScans(recentScans.value, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
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
          const Text(
            '👋 Welcome to Flean',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Scan any food product to see its complete nutritional breakdown, ingredients, additives, and health insights.',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
          const SizedBox(height: 16),
          CupertinoButton(
            padding: EdgeInsets.zero,
            color: CupertinoColors.systemGreen,
            borderRadius: BorderRadius.circular(12),
            onPressed: () {
              context.go('/scan');
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedQrCode01, size: 20, color: CupertinoColors.white),
                  SizedBox(width: 8),
                  Text(
                    'Scan a Product',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentScans(List<HistoryItem> recentScans, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Scans',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
              if (recentScans.isNotEmpty)
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.go('/history');
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
        const SizedBox(height: 8),
        Expanded(
          child: recentScans.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: recentScans.length,
                  itemBuilder: (context, index) {
                    return HistoryItemWidget(item: recentScans[index]);
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
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedQrCode01,
              size: 48,
              color: CupertinoColors.systemGrey,
            ),
            SizedBox(height: 16),
            Text(
              'No scans yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.label,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Start scanning products to see\nyour history here',
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

  // Analytics tracking methods
  Future<void> _trackScreenViewed(WidgetRef ref) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackScreenViewed('home', 0, null);
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
