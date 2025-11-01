import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/core/analytics/analytics_service.dart';

class AppShell extends ConsumerWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouterState.of(context).uri.path;

    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: child,
      bottomNavigationBar: _buildBottomNavigation(context, ref, currentLocation),
    );
  }

  Widget _buildBottomNavigation(BuildContext context, WidgetRef ref, String currentLocation) {
    final currentIndex = _getTabIndex(currentLocation);

    return CupertinoTabBar(
      backgroundColor: CupertinoColors.systemBackground,
      activeColor: CupertinoColors.systemGreen,
      inactiveColor: CupertinoColors.systemGrey,
      height: 60,
      items: [
        BottomNavigationBarItem(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24, color: CupertinoColors.systemGrey),
          activeIcon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24, color: CupertinoColors.systemGreen),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedQrCode01, size: 24, color: CupertinoColors.systemGrey),
          activeIcon: HugeIcon(icon: HugeIcons.strokeRoundedQrCode01, size: 24, color: CupertinoColors.systemGreen),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedClock01, size: 24, color: CupertinoColors.systemGrey),
          activeIcon: HugeIcon(icon: HugeIcons.strokeRoundedClock01, size: 24, color: CupertinoColors.systemGreen),
          label: 'History',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) => _onTabTapped(context, ref, index, currentIndex),
    );
  }

  int _getTabIndex(String location) {
    switch (location) {
      case '/home':
        return 0;
      case '/scan':
        return 1;
      case '/history':
        return 2;
      default:
        return 0;
    }
  }

  void _onTabTapped(BuildContext context, WidgetRef ref, int index, int currentIndex) {
    // Prevent unnecessary navigation if already on the same tab
    if (index == currentIndex) {
      return;
    }

    // Haptic feedback for tab navigation
    HapticFeedback.selectionClick();

    // Track tab switching
    _trackTabSwitched(ref, currentIndex, index);

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/scan');
        break;
      case 2:
        context.go('/history');
        break;
    }
  }

  // Analytics tracking method
  Future<void> _trackTabSwitched(WidgetRef ref, int fromIndex, int toIndex) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      final tabNames = ['home', 'scan', 'history'];
      await analytics.trackTabSwitched(
        tabNames[fromIndex],
        tabNames[toIndex],
        0, // Time on previous tab - we don't track this yet
      );
    } catch (e) {
      log('Analytics error: $e', name: 'App');
    }
  }
}
