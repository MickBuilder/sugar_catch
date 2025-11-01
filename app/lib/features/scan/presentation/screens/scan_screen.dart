import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/core/analytics/analytics_service.dart';
import 'package:cleanfood/features/scan/scan_provider.dart';

class ScanScreen extends HookConsumerWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scannerController = useMemoized(() => MobileScannerController());
    final isProcessing = useState(false);
    final scannerPaused = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    useEffect(() {
      // Start the animation
      animationController.repeat(reverse: true);
      return () {
        // Stop animation if it's running
        if (animationController.isAnimating) {
          animationController.stop();
        }
        // Note: Don't dispose animationController manually - useAnimationController hook handles it
        // Dispose scanner controller safely
        try {
          scannerController.dispose();
        } catch (e) {
          // Scanner controller already disposed
          log('ScannerController already disposed: $e', name: 'Scan');
        }
      };
    }, []);

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xFF1A1A1A),
        border: null,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.go('/home'),
          child: HugeIcon(icon: HugeIcons.strokeRoundedCancelCircle, color: CupertinoColors.white, size: 24),
        ),
        middle: const Text(
          'Scan Barcode',
          style: TextStyle(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      child: Stack(
        children: [
          // Main content
          Column(
            children: [
              // Camera view area
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF3A3A3A),
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Stack(
                      children: [
                        MobileScanner(
                          controller: scannerController,
                          onDetect: (capture) async {
                            log(
                              '📱 [SCAN_SCREEN] Barcode detected, checking state...', name: 'Scan');
                            log(
                              '📱 [SCAN_SCREEN] isProcessing: ${isProcessing.value}, scannerPaused: ${scannerPaused.value}', name: 'Scan');

                            // Prevent multiple processing
                            if (isProcessing.value || scannerPaused.value) {
                              log(
                                '📱 [SCAN_SCREEN] Already processing or paused, ignoring detection',name: 'Scan');
                              return;
                            }

                            final List<Barcode> barcodes = capture.barcodes;
                            if (barcodes.isNotEmpty) {
                              final String? code = barcodes.first.rawValue;
                              if (code != null) {
                                log(
                                  '📱 [SCAN_SCREEN] Valid barcode detected: $code',name: 'Scan');
                                isProcessing.value = true;

                                // Pause scanning immediately to prevent multiple scans
                                scannerPaused.value = true;
                                log('📱 [SCAN_SCREEN] Pausing scanner...', name: 'Scan');
                                await scannerController.stop();

                                try {
                                  // Store context mounted state before async operations
                                  if (!context.mounted) {
                                    log(
                                      '📱 [SCAN_SCREEN] Context not mounted, aborting',
                                    name: 'Scan');
                                    return;
                                  }

                                  // Fetch product info and navigate to product screen
                                  if (context.mounted) {
                                    log(
                                      '📱 [SCAN_SCREEN] Calling _handleBarcodeDetected...',
                                     name: 'Scan');
                                    await _handleBarcodeDetected(
                                      context,
                                      ref,
                                      code,
                                      scannerController,
                                      scannerPaused,
                                    );
                                  }
                                } finally {
                                  // Reset the processing flag
                                  log(
                                    '📱 [SCAN_SCREEN] Resetting processing flag',
                                  name: 'Scan');
                                  isProcessing.value = false;
                                }
                              } else {
                                log(
                                  '📱 [SCAN_SCREEN] Barcode detected but rawValue is null',
                                 name: 'Scan');
                              }
                            } else {
                              log('📱 [SCAN_SCREEN] No barcodes in capture', name: 'Scan');
                            }
                          },
                        ),
                        // Animated scanning line
                        AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) {
                            return Positioned(
                              top:
                                  (MediaQuery.of(context).size.height * 0.025) +
                                  (MediaQuery.of(context).size.height *
                                      0.5 *
                                      animationController.value),
                              left: 16,
                              right: 16,
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      CupertinoColors.systemGreen,
                                      Colors.transparent,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CupertinoColors.systemGreen
                                          .withValues(alpha: 0.5),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Search bar
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CupertinoTextField(
                  style: const TextStyle(color: CupertinoColors.white),
                  placeholder: 'Or search for a product',
                  placeholderStyle: const TextStyle(
                    color: CupertinoColors.systemGrey,
                  ),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01,
                      color: CupertinoColors.systemGrey,
                      size: 20,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: const BoxDecoration(),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      _handleManualSearch(context, ref, value, scannerPaused);
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
          // Resume scanning button overlay
          if (scannerPaused.value)
            Positioned(
              bottom: 100,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF3A3A3A), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withValues(alpha: 0.15),
                      blurRadius: 4,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: CupertinoButton(
                  onPressed: () async {
                    scannerPaused.value = false;
                    await scannerController.start();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedQrCode01,
                          color: CupertinoColors.systemGreen,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Tap to Scan Again',
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
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleBarcodeDetected(
    BuildContext context,
    WidgetRef ref,
    String barcode,
    MobileScannerController scannerController,
    ValueNotifier<bool> scannerPaused,
  ) async {
    log('🎯 [HANDLE_BARCODE] Starting barcode handling for: $barcode', name: 'Scan');

    // Track scan initiated
    try {
      log('📊 [ANALYTICS] Starting scan initiated tracking...', name: 'Scan');
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackScanInitiated('camera');
      log('📊 [ANALYTICS] Scan initiated tracked successfully', name: 'Scan');
    } catch (e) {
      log('📊 [ANALYTICS] Error tracking scan initiated: $e', name: 'Scan');
    }

    try {
      // Check if context is still mounted before proceeding
      if (!context.mounted) {
        log('🎯 [HANDLE_BARCODE] Context not mounted, aborting', name: 'Scan');
        return;
      }

      log('🎯 [HANDLE_BARCODE] Calling scanNotifierProvider.scanBarcode...', name: 'Scan');
      await ref.read(scanNotifierProvider.notifier).scanBarcode(barcode);
      log('🎯 [HANDLE_BARCODE] scanBarcode completed successfully', name: 'Scan');
      
      // Haptic feedback for successful scan
      HapticFeedback.heavyImpact();
      log('🎯 [HANDLE_BARCODE] Haptic feedback triggered for successful scan', name: 'Scan');

      // Track successful scan
      try {
        log('📊 [ANALYTICS] Starting scan successful tracking...', name: 'Scan');
        final analytics = await ref.read(analyticsServiceProvider.future);
        await analytics.trackScanSuccessful(barcode, true, 1000); // Assuming 1 second scan duration
        log('📊 [ANALYTICS] Scan successful tracked successfully', name: 'Scan');
      } catch (e) {
        log('📊 [ANALYTICS] Error tracking scan successful: $e', name: 'Scan');
      }

      // Wait for the state to be properly updated and check it
      await Future.delayed(const Duration(milliseconds: 50));
      final currentState = ref.read(scanNotifierProvider);
      log(
        '🎯 [HANDLE_BARCODE] Current state after scan: ${currentState.runtimeType}',
      name: 'Scan');
      log('🎯 [HANDLE_BARCODE] Current state value: $currentState', name: 'Scan');

      // Check again after async operation
      if (context.mounted) {
        log('🎯 [HANDLE_BARCODE] Navigating to ProductScreen...', name: 'Scan');
        context.push('/product/$barcode');
        log('🎯 [HANDLE_BARCODE] Navigation completed', name: 'Scan');
      } else {
        log(
          '🎯 [HANDLE_BARCODE] Context not mounted after scanBarcode, skipping navigation',
         name: 'Scan');
      }
    } catch (e, stackTrace) {
      log('❌ [HANDLE_BARCODE] Error occurred: $e', name: 'Scan');
      log('❌ [HANDLE_BARCODE] Stack trace: $stackTrace', name: 'Scan');

      // Track scan failure
      try {
        final analytics = await ref.read(analyticsServiceProvider.future);
        await analytics.trackScanFailed('scan_error', 0);
      } catch (analyticsError) {
        log('Analytics error: $analyticsError', name: 'Scan');
      }

      // Reset scanning state on error
      log('🎯 [HANDLE_BARCODE] Resetting scanner state...', name: 'Scan');
      scannerPaused.value = false;
      await scannerController.start();

      if (context.mounted) {
        log('🎯 [HANDLE_BARCODE] Error scanning product: $e', name: 'Scan');
        // Haptic feedback for error
        HapticFeedback.heavyImpact();
        log('🎯 [HANDLE_BARCODE] Haptic feedback triggered for scan error', name: 'Scan');
        // TODO: Show Cupertino alert dialog for error
      }
    }
  }

  void _handleManualSearch(
    BuildContext context,
    WidgetRef ref,
    String searchTerm,
    ValueNotifier<bool> scannerPaused,
  ) async {
    try {
      // For manual search, we'll use the search term as a mock barcode
      // In a real app, you'd implement a search API that returns a barcode
      await ref
          .read(scanNotifierProvider.notifier)
          .scanBarcode(searchTerm);

      if (context.mounted) {
        // Navigate to product screen with the search term as barcode
        context.push('/product/$searchTerm');
      }
    } catch (e) {
      if (context.mounted) {
        log('🎯 [HANDLE_MANUAL_SEARCH] Error searching product: $e', name: 'Scan');
        // TODO: Show Cupertino alert dialog for error
      }
    }
  }
}
