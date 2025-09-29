import 'package:flutter/cupertino.dart';
import 'package:sweetr/features/scan/data/product_model.dart';
import 'package:sweetr/features/track/data/track_models.dart';

class ServingSizeWidget extends StatefulWidget {
  final Product product;
  final SugarInfo sugarInfo;
  final double initialQuantity;
  final Function(double quantity, double sugarAmount) onQuantityChanged;

  const ServingSizeWidget({
    super.key,
    required this.product,
    required this.sugarInfo,
    this.initialQuantity = 1.0,
    required this.onQuantityChanged,
  });

  @override
  State<ServingSizeWidget> createState() => _ServingSizeWidgetState();
}

class _ServingSizeWidgetState extends State<ServingSizeWidget> {
  late double _quantity;
  bool _isCustomMode = false;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
    // Call _notifyQuantityChanged() after the widget is built to ensure parent gets initial values
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyQuantityChanged();
    });
  }

  void _selectPredefinedSize(double quantity) {
    setState(() {
      if (quantity == -1.0) {
        // Custom button clicked
        _isCustomMode = true;
      } else {
        // Regular size selected
        _quantity = quantity;
        _isCustomMode = false;
        _notifyQuantityChanged();
      }
    });
  }

  void _onSliderChanged(double value) {
    setState(() {
      _quantity = value;
      _notifyQuantityChanged();
    });
  }

  void _notifyQuantityChanged() {
    final servingSize = ServingSizeCalculator.calculateServingSize(
      product: widget.product,
      sugarInfo: widget.sugarInfo,
      quantity: _quantity,
    );
    widget.onQuantityChanged(_quantity, servingSize.sugarPerServing);
  }

  @override
  Widget build(BuildContext context) {
    final servingSize = ServingSizeCalculator.calculateServingSize(
      product: widget.product,
      sugarInfo: widget.sugarInfo,
      quantity: _quantity,
    );

    final productQuantity = double.tryParse(widget.product.productQuantity ?? '1.0') ?? 1.0;
    final unit = servingSize.unit;

    // Popular serving size options - adapt to product unit
    final List<Map<String, dynamic>> popularSizes;
    if (unit == 'ml') {
      popularSizes = [
        {'label': '1/4 cup (60ml)', 'quantity': 60.0},
        {'label': '1/2 cup (120ml)', 'quantity': 120.0},
        {'label': '3/4 cup (180ml)', 'quantity': 180.0},
        {'label': '1 cup (240ml)', 'quantity': 240.0},
        {'label': 'Custom', 'quantity': -1.0}, // Special value for custom mode
      ];
    } else {
      // For grams or other units, use fractional servings
      popularSizes = [
        {'label': '1/4 serving', 'quantity': productQuantity * 0.25},
        {'label': '1/2 serving', 'quantity': productQuantity * 0.5},
        {'label': '3/4 serving', 'quantity': productQuantity * 0.75},
        {'label': '1 serving', 'quantity': productQuantity * 1.0},
        {'label': 'Custom', 'quantity': -1.0}, // Special value for custom mode
      ];
    }

    return Column(
      children: [
        // Popular sizes - horizontal scrollable row (always visible)
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularSizes.length,
            itemBuilder: (context, index) {
              final size = popularSizes[index];
              final quantity = size['quantity'] as double;
              final isCustomButton = quantity == -1.0;
              final isSelected = isCustomButton 
                  ? _isCustomMode 
                  : (_quantity - quantity).abs() < 0.01;
              
              return Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 0 : 8,
                  right: index == popularSizes.length - 1 ? 0 : 8,
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _selectPredefinedSize(quantity),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? CupertinoColors.systemGreen 
                          : CupertinoColors.systemGrey5,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected 
                            ? CupertinoColors.systemGreen 
                            : CupertinoColors.separator,
                        width: 0.5,
                      ),
                    ),
                    child: Text(
                      size['label'] as String,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected 
                            ? CupertinoColors.white 
                            : CupertinoColors.label,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Custom slider (appears above serving size when custom mode is active)
        if (_isCustomMode) ...[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0$unit',
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  Text(
                    '${productQuantity.toStringAsFixed(1)}$unit',
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: CupertinoSlider(
                  value: _quantity.clamp(0.0, productQuantity),
                  min: 0.0,
                  max: productQuantity,
                  divisions: (productQuantity * 10).round(),
                  onChanged: _onSliderChanged,
                  activeColor: CupertinoColors.systemGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
        
        // Current serving display
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Serving Size:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.label,
                ),
              ),
              Text(
                '${_quantity.toStringAsFixed(1)}$unit',
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
    );
  }
}