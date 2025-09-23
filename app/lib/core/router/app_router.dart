import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/home/presentation/screens/home_screen.dart';
import 'package:sugar_catch/features/scan/presentation/screens/scan_screen.dart';
import 'package:sugar_catch/features/scan/presentation/screens/product_screen.dart';
import 'package:sugar_catch/features/track/presentation/screens/track_screen.dart';
import 'package:sugar_catch/features/history/presentation/screens/history_screen.dart';
import 'package:sugar_catch/features/progress/presentation/screens/progress_screen.dart';
import 'package:sugar_catch/core/widgets/app_shell.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/track',
            name: 'track',
            builder: (context, state) => const TrackScreen(),
          ),
          GoRoute(
            path: '/history',
            name: 'history',
            builder: (context, state) => const HistoryScreen(),
          ),
          GoRoute(
            path: '/progress',
            name: 'progress',
            builder: (context, state) => const ProgressScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/scan',
        name: 'scan',
        builder: (context, state) => const ScanScreen(),
      ),
      GoRoute(
        path: '/product/:barcode',
        name: 'product',
        builder: (context, state) {
          final barcode = state.pathParameters['barcode']!;
          return ProductScreen(barcode: barcode);
        },
      ),
    ],
  );
});
