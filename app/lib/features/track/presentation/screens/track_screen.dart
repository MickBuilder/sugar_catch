import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/core/services/history_service.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';
import 'package:sugar_catch/features/track/data/track_models.dart';
import 'package:sugar_catch/features/track/track_provider.dart';
import 'package:sugar_catch/features/track/presentation/widgets/product_picker_widget.dart';
import 'package:sugar_catch/features/track/presentation/widgets/serving_section_widget.dart';
import 'package:sugar_catch/features/track/presentation/widgets/daily_log_entry_widget.dart';

class TrackScreen extends ConsumerStatefulWidget {
  const TrackScreen({super.key});

  @override
  ConsumerState<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends ConsumerState<TrackScreen> {
  HistoryItem? _selectedProduct;

  @override
  Widget build(BuildContext context) {
    final todaysLog = ref.watch(trackNotifierProvider);
    final recentHistory = ref.watch(recentHistoryProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text(
          'Track',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Picker Section
                    ProductPickerWidget(
                      recentHistory: recentHistory,
                      selectedProduct: _selectedProduct,
                      onProductSelected: (product) {
                        setState(() {
                          _selectedProduct = product;
                        });
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Serving Section
                    ServingSectionWidget(
                      selectedProduct: _selectedProduct,
                      onAddToLog: (product, quantity, sugarAmount) => _addToLog(
                        ref,
                        product.product,
                        product.sugarInfo,
                        quantity,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Today's Log Section
                    _buildTodaysLogSection(context, ref, todaysLog),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTodaysLogSection(
    BuildContext context,
    WidgetRef ref,
    DailyLog? todaysLog,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Log",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label,
          ),
        ),
        const SizedBox(height: 12),
        
        Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CupertinoColors.separator,
              width: 0.5,
            ),
          ),
          child: Column(
            children: [
              if (todaysLog == null || todaysLog.entries.isEmpty)
                Container(
                  padding: const EdgeInsets.all(24),
                  child: const Center(
                    child: Text(
                      'No items logged today.\nAdd products from recently scanned to start tracking!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                )
              else ...[
                // Log entries
                ...todaysLog.entries.map((entry) => DailyLogEntryWidget(
                  entry: entry,
                  onRemove: () => _removeFromLog(ref, entry.id),
                )),
                
                // Total sugar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CupertinoColors.separator,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Sugar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label,
                        ),
                      ),
                      Text(
                        '${todaysLog.totalSugar.toStringAsFixed(1)}g',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  void _addToLog(
    WidgetRef ref,
    Product product,
    SugarInfo sugarInfo,
    double quantity,
  ) {
    ref.read(trackNotifierProvider.notifier).addToDailyLog(
      product: product,
      sugarInfo: sugarInfo,
      quantity: quantity,
    );
    
    // Show success feedback
    _showSuccessFeedback();
  }

  void _removeFromLog(WidgetRef ref, String entryId) {
    ref.read(trackNotifierProvider.notifier).removeLogEntry(entryId);
  }

  void _showSuccessFeedback() {
    // You could implement a toast or haptic feedback here
    print('✅ Added to daily log!');
  }
}