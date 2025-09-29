import 'package:flutter/cupertino.dart';
import 'package:sweetr/core/services/history_service.dart';

class ProductPickerWidget extends StatelessWidget {
  final List<HistoryItem> recentHistory;
  final HistoryItem? selectedProduct;
  final Function(HistoryItem?) onProductSelected;

  const ProductPickerWidget({
    super.key,
    required this.recentHistory,
    required this.selectedProduct,
    required this.onProductSelected,
  });

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Select Product',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.label,
            ),
          ),
          const SizedBox(height: 12),
          
          if (recentHistory.isEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'No recently scanned products.\nScan some products first!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
            )
          else
            CupertinoButton(
              onPressed: () => _showProductPicker(context),
              padding: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CupertinoColors.separator,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  children: [
                    // Product image or fallback icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: selectedProduct?.product.imageUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                selectedProduct!.product.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    CupertinoIcons.square_stack_3d_down_right,
                                    color: CupertinoColors.systemGrey,
                                    size: 20,
                                  );
                                },
                              ),
                            )
                          : const Icon(
                              CupertinoIcons.square_stack_3d_down_right,
                              color: CupertinoColors.systemGrey,
                              size: 20,
                            ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Product name
                    Expanded(
                      child: Text(
                        selectedProduct?.product.productName ?? 'Tap to select a product',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: selectedProduct != null 
                              ? CupertinoColors.label 
                              : CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    
                    // Dropdown arrow
                    const Icon(
                      CupertinoIcons.chevron_down,
                      color: CupertinoColors.systemGrey,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showProductPicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.separator,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: CupertinoColors.systemBlue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Text(
                      'Select Product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: CupertinoColors.systemBlue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Product list
              Expanded(
                child: ListView.builder(
                  itemCount: recentHistory.length,
                  itemBuilder: (context, index) {
                    final item = recentHistory[index];
                    final isSelected = selectedProduct?.product.code == item.product.code;
                    
                    return CupertinoButton(
                      onPressed: () {
                        onProductSelected(item);
                        Navigator.of(context).pop();
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? CupertinoColors.systemBlue.withValues(alpha: 0.1)
                              : null,
                          border: const Border(
                            bottom: BorderSide(
                              color: CupertinoColors.separator,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            // Product image
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: item.product.imageUrl != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        item.product.imageUrl!,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Icon(
                                            CupertinoIcons.square_stack_3d_down_right,
                                            color: CupertinoColors.systemGrey,
                                            size: 20,
                                          );
                                        },
                                      ),
                                    )
                                  : const Icon(
                                      CupertinoIcons.square_stack_3d_down_right,
                                      color: CupertinoColors.systemGrey,
                                      size: 20,
                                    ),
                            ),
                            const SizedBox(width: 12),
                            
                            // Product info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.productName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected 
                                          ? CupertinoColors.systemBlue 
                                          : CupertinoColors.label,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${item.sugarInfo.sugarsPer100g.toStringAsFixed(1)}g sugar per 100${item.product.productQuantityUnit?.toLowerCase() ?? 'g'}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Selection indicator
                            if (isSelected)
                              const Icon(
                                CupertinoIcons.checkmark_circle_fill,
                                color: CupertinoColors.systemBlue,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
