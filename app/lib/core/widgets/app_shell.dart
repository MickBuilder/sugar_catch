import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/core/analytics/analytics_service.dart';

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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          activeIcon: Icon(CupertinoIcons.house_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.add_circled),
          activeIcon: Icon(CupertinoIcons.add_circled_solid),
          label: 'Track',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.qrcode_viewfinder),
          activeIcon: Icon(CupertinoIcons.qrcode_viewfinder),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.clock),
          activeIcon: Icon(CupertinoIcons.clock_fill),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chart_bar),
          activeIcon: Icon(CupertinoIcons.chart_bar_fill),
          label: 'Progress',
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
      case '/track':
        return 1;
      case '/scan':
        return 2;
      case '/history':
        return 3;
      case '/progress':
        return 4;
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
        context.go('/track');
        break;
      case 2:
        context.go('/scan');
        break;
      case 3:
        context.go('/history');
        break;
      case 4:
        context.go('/progress');
        break;
    }
  }

  // Analytics tracking method
  Future<void> _trackTabSwitched(WidgetRef ref, int fromIndex, int toIndex) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      final tabNames = ['home', 'track', 'scan', 'history', 'progress'];
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
