import 'package:flutter/cupertino.dart';
import 'package:sugar_catch/core/services/history_service.dart';
import 'package:sugar_catch/features/track/data/track_models.dart';
import 'package:sugar_catch/features/track/presentation/widgets/serving_size_widget.dart';

class ServingSectionWidget extends StatefulWidget {
  final HistoryItem? selectedProduct;
  final Function(HistoryItem product, double quantity, double sugarAmount) onAddToLog;

  const ServingSectionWidget({
    super.key,
    required this.selectedProduct,
    required this.onAddToLog,
  });

  @override
  State<ServingSectionWidget> createState() => _ServingSectionWidgetState();
}

class _ServingSectionWidgetState extends State<ServingSectionWidget> {
  double _currentQuantity = 1.0;
  double _currentSugarAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _updateSugarAmount();
  }

  @override
  void didUpdateWidget(ServingSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedProduct != widget.selectedProduct) {
      _currentQuantity = 1.0; // Reset to default serving size
      _updateSugarAmount();
    }
  }

  void _updateSugarAmount() {
    if (widget.selectedProduct != null) {
      final servingSize = ServingSizeCalculator.calculateServingSize(
        product: widget.selectedProduct!.product,
        sugarInfo: widget.selectedProduct!.sugarInfo,
        quantity: _currentQuantity,
      );
      _currentSugarAmount = servingSize.sugarPerServing;
    } else {
      _currentSugarAmount = 0.0;
    }
  }

  void _onQuantityChanged(double quantity, double sugarAmount) {
    setState(() {
      _currentQuantity = quantity;
      _currentSugarAmount = sugarAmount;
    });
  }

  void _addToLog() {
    if (widget.selectedProduct != null) {
      widget.onAddToLog(widget.selectedProduct!, _currentQuantity, _currentSugarAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedProduct == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: CupertinoColors.separator,
            width: 0.5,
          ),
        ),
        child: const Center(
          child: Text(
            'Select a product to adjust serving size',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
      );
    }

    final product = widget.selectedProduct!.product;
    final sugarInfo = widget.selectedProduct!.sugarInfo;
    final productUnit = product.productQuantityUnit?.toLowerCase() ?? 'g';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CupertinoColors.separator,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          const Text(
            'Serving Size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.label,
            ),
          ),
          const SizedBox(height: 16),
          
          // Product info
          Row(
            children: [
              // Product image
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: product.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              CupertinoIcons.square_stack_3d_down_right,
                              color: CupertinoColors.systemGrey,
                              size: 24,
                            );
                          },
                        ),
                      )
                    : const Icon(
                        CupertinoIcons.square_stack_3d_down_right,
                        color: CupertinoColors.systemGrey,
                        size: 24,
                      ),
              ),
              const SizedBox(width: 12),
              
              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${sugarInfo.sugarsPer100g.toStringAsFixed(1)}g sugar per 100$productUnit',
                      style: const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Serving size controls
          ServingSizeWidget(
            product: product,
            sugarInfo: sugarInfo,
            initialQuantity: _currentQuantity,
            onQuantityChanged: _onQuantityChanged,
          ),
          
          const SizedBox(height: 16),
          
          // Sugar amount display
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sugar in this serving:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CupertinoColors.label,
                  ),
                ),
                Text(
                  '${_currentSugarAmount.toStringAsFixed(1)}g',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Add to log button
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              onPressed: _addToLog,
              color: CupertinoColors.systemGreen,
              borderRadius: BorderRadius.circular(12),
              child: const Text(
                'Add to Daily Log',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
