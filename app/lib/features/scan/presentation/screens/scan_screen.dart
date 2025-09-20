import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sugar_catch/features/scan/scan_provider.dart';
import 'package:sugar_catch/features/scan/presentation/screens/product_screen.dart';

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
          print('ScannerController already disposed: $e');
        }
      };
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Scan Barcode',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
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
                            print('📱 [SCAN_SCREEN] Barcode detected, checking state...');
                            print('📱 [SCAN_SCREEN] isProcessing: ${isProcessing.value}, scannerPaused: ${scannerPaused.value}');
                            
                            // Prevent multiple processing
                            if (isProcessing.value || scannerPaused.value) {
                              print('📱 [SCAN_SCREEN] Already processing or paused, ignoring detection');
                              return;
                            }

                            final List<Barcode> barcodes = capture.barcodes;
                            if (barcodes.isNotEmpty) {
                              final String? code = barcodes.first.rawValue;
                              if (code != null) {
                                print('📱 [SCAN_SCREEN] Valid barcode detected: $code');
                                isProcessing.value = true;

                                // Pause scanning immediately to prevent multiple scans
                                scannerPaused.value = true;
                                print('📱 [SCAN_SCREEN] Pausing scanner...');
                                await scannerController.stop();

                                try {
                                  // Store context mounted state before async operations
                                  if (!context.mounted) {
                                    print('📱 [SCAN_SCREEN] Context not mounted, aborting');
                                    return;
                                  }

                                  // Fetch product info and navigate to product screen
                                  if (context.mounted) {
                                    print('📱 [SCAN_SCREEN] Calling _handleBarcodeDetected...');
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
                                  print('📱 [SCAN_SCREEN] Resetting processing flag');
                                  isProcessing.value = false;
                                }
                              } else {
                                print('📱 [SCAN_SCREEN] Barcode detected but rawValue is null');
                              }
                            } else {
                              print('📱 [SCAN_SCREEN] No barcodes in capture');
                            }
                          },
                        ),
                        // Animated scanning line
                        AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) {
                            return Positioned(
                              top: (MediaQuery.of(context).size.height * 0.025) + 
                                   (MediaQuery.of(context).size.height * 0.5 * animationController.value),
                              left: 16,
                              right: 16,
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.green,
                                      Colors.transparent,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withValues(alpha: 0.5),
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
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Or search for a product',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
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
                  border: Border.all(
                    color: const Color(0xFF3A3A3A),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 4,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      scannerPaused.value = false;
                      await scannerController.start();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.qr_code_scanner,
                            color: Colors.green,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Tap to Scan Again',
                            style: TextStyle(
                              color: Colors.white,
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
    print('🎯 [HANDLE_BARCODE] Starting barcode handling for: $barcode');
    
    try {
      // Check if context is still mounted before proceeding
      if (!context.mounted) {
        print('🎯 [HANDLE_BARCODE] Context not mounted, aborting');
        return;
      }
      
      print('🎯 [HANDLE_BARCODE] Calling scanNotifierProvider.scanBarcode...');
      await ref.read(scanNotifierProvider.notifier).scanBarcode(barcode);
      print('🎯 [HANDLE_BARCODE] scanBarcode completed successfully');
      
      // Wait for the state to be properly updated and check it
      await Future.delayed(const Duration(milliseconds: 50));
      final currentState = ref.read(scanNotifierProvider);
      print('🎯 [HANDLE_BARCODE] Current state after scan: ${currentState.runtimeType}');
      print('🎯 [HANDLE_BARCODE] Current state value: $currentState');
      
      // Check again after async operation
      if (context.mounted) {
        print('🎯 [HANDLE_BARCODE] Navigating to ProductScreen...');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductScreen(),
          ),
        );
        print('🎯 [HANDLE_BARCODE] Navigation completed');
      } else {
        print('🎯 [HANDLE_BARCODE] Context not mounted after scanBarcode, skipping navigation');
      }
    } catch (e, stackTrace) {
      print('❌ [HANDLE_BARCODE] Error occurred: $e');
      print('❌ [HANDLE_BARCODE] Stack trace: $stackTrace');
      
      // Reset scanning state on error
      print('🎯 [HANDLE_BARCODE] Resetting scanner state...');
      scannerPaused.value = false;
      await scannerController.start();
      
      if (context.mounted) {
        print('🎯 [HANDLE_BARCODE] Showing error snackbar...');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error scanning product: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
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
      // For manual search, we'll use a mock barcode
      // In a real app, you'd implement a search API
      await ref.read(scanNotifierProvider.notifier).scanBarcode('manual_search');
      
      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductScreen(),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error searching product: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
