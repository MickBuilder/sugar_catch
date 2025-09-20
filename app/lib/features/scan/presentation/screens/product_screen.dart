import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/scan/scan_provider.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanState = ref.watch(scanNotifierProvider);
    
    // Debug logging
    print('📱 [PRODUCT_SCREEN] scanState: $scanState');
    print('📱 [PRODUCT_SCREEN] scanState is null: ${scanState == null}');
    if (scanState != null) {
      print('📱 [PRODUCT_SCREEN] scanState.productName: ${scanState.product.productName}');
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Nutrition Facts',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: scanState == null
          ? const Center(
              child: Text('No product data available'),
            )
          : _buildProductContent(context, scanState),
      bottomNavigationBar: scanState == null
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add to daily log functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to daily log!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Add to Daily Log',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildProductContent(BuildContext context, ScanState data) {
    final product = data.product;
    final sugarInfo = data.sugarInfo;
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image and name
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image (square, aligned at beginning)
                if (product.imageUrl != null) ...[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[100],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 30,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                // Product name and brand (aligned to start)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productNameEn ?? product.productName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.5,
                        ),
                      ),
                      if (product.brands != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          product.brands!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600],
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Sugar Analysis
          Text(
            'Sugar Analysis',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sugar level and value
                Row(
                  children: [
                    // Sugar level text
                    Expanded(
                      child: Text(
                        _getSugarLevelText(sugarInfo.sugarsPer100g, sugarInfo.productUnit),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    // Sugar value with color indicator
                    Row(
                      children: [
                        Text(
                          '${sugarInfo.sugarsPer100g.toStringAsFixed(1)}g',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _getSugarLevelColor(sugarInfo.sugarsPer100g, sugarInfo.productUnit),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Color-coded sugar level bar
                _buildSugarLevelBar(sugarInfo.sugarsPer100g, sugarInfo.productUnit),
                
                const SizedBox(height: 16),
                
                // Total sugar in product info alert
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue[600],
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Total sugar in product: ${sugarInfo.totalSugarsInProduct.toStringAsFixed(1)}g',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue[800],
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Hidden Sugar Ingredients
          Text(
            'Hidden Sugar Ingredients',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: sugarInfo.hiddenSugarIngredients.isNotEmpty
                ? Column(
                    children: sugarInfo.hiddenSugarIngredients.asMap().entries.map((entry) {
                      final index = entry.key;
                      final ingredient = entry.value;
                      final isLast = index == sugarInfo.hiddenSugarIngredients.length - 1;
                      
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: isLast
                              ? null
                              : Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[200]!,
                                    width: 1,
                                  ),
                                ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.warning,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ingredient.textEn ?? ingredient.text,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                  if (ingredient.percentEstimate != null) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      '~${ingredient.percentEstimate!.toStringAsFixed(1)}%',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[600],
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )
                : Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No Hidden Sugars Found!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This product doesn\'t contain any hidden sugar ingredients.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600],
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper method to get sugar level text based on amount and unit
  String _getSugarLevelText(double sugarPer100g, String productUnit) {
    if (productUnit.toLowerCase() == 'ml') {
      // For ml: 0, 1.5, 3, 7, 13
      if (sugarPer100g <= 1.5) {
        return 'Very low sugar';
      } else if (sugarPer100g <= 3.0) {
        return 'Low sugar';
      } else if (sugarPer100g <= 7.0) {
        return 'Moderate sugar';
      } else if (sugarPer100g <= 13.0) {
        return 'High sugar';
      } else {
        return 'Too sweet';
      }
    } else {
      // For g: 0, 9, 18, 31, 45
      if (sugarPer100g <= 9.0) {
        return 'Low sugar';
      } else if (sugarPer100g <= 18.0) {
        return 'Moderate sugar';
      } else if (sugarPer100g <= 31.0) {
        return 'High sugar';
      } else if (sugarPer100g <= 45.0) {
        return 'Very high sugar';
      } else {
        return 'Too sweet';
      }
    }
  }

  // Helper method to get sugar level color based on amount and unit
  Color _getSugarLevelColor(double sugarPer100g, String productUnit) {
    if (productUnit.toLowerCase() == 'ml') {
      // For ml: 0, 1.5, 3, 7, 13
      if (sugarPer100g <= 1.5) {
        return Colors.green[700]!; // Dark green
      } else if (sugarPer100g <= 3.0) {
        return Colors.green[500]!; // Light green
      } else if (sugarPer100g <= 7.0) {
        return Colors.orange[600]!; // Orange
      } else if (sugarPer100g <= 13.0) {
        return Colors.red[600]!; // Red
      } else {
        return Colors.red[800]!; // Dark red
      }
    } else {
      // For g: 0, 9, 18, 31, 45
      if (sugarPer100g <= 9.0) {
        return Colors.green[700]!; // Dark green
      } else if (sugarPer100g <= 18.0) {
        return Colors.green[500]!; // Light green
      } else if (sugarPer100g <= 31.0) {
        return Colors.orange[600]!; // Orange
      } else if (sugarPer100g <= 45.0) {
        return Colors.red[600]!; // Red
      } else {
        return Colors.red[800]!; // Dark red
      }
    }
  }

  // Helper method to build the color-coded sugar level bar
  Widget _buildSugarLevelBar(double sugarPer100g, String productUnit) {
    if (productUnit.toLowerCase() == 'ml') {
      // For ml: 0, 1.5, 3, 7, 13
      return Column(
        children: [
          // Level bar
          Container(
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2E7D32), // Dark green (0-1.5)
                  Color(0xFF4CAF50), // Light green (1.5-3)
                  Color(0xFFFF9800), // Orange (3-7)
                  Color(0xFFF44336), // Red (7-13)
                ],
                stops: [0.0, 0.25, 0.5, 1.0],
              ),
            ),
            child: Stack(
              children: [
              // Current value indicator
              Positioned(
                left: _getSugarLevelPosition(sugarPer100g, 13.0) - 4, // Center the triangle
                child: CustomPaint(
                  painter: TrianglePainter(),
                  size: const Size(8, 8),
                ),
              ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Level labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('0', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('1.5', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('3', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('7', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('13', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      );
    } else {
      // For g: 0, 9, 18, 31, 45
      return Column(
        children: [
          // Level bar
          Container(
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2E7D32), // Dark green (0-9)
                  Color(0xFF4CAF50), // Light green (9-18)
                  Color(0xFFFF9800), // Orange (18-31)
                  Color(0xFFF44336), // Red (31-45)
                ],
                stops: [0.0, 0.25, 0.5, 1.0],
              ),
            ),
            child: Stack(
              children: [
              // Current value indicator
              Positioned(
                left: _getSugarLevelPosition(sugarPer100g, 45.0) - 4, // Center the triangle
                child: CustomPaint(
                  painter: TrianglePainter(),
                  size: const Size(8, 8),
                ),
              ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Level labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('0', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('9', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('18', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('31', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('45', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      );
    }
  }

  // Helper method to calculate position of indicator on the bar
  double _getSugarLevelPosition(double sugarPer100g, double maxValue) {
    // Clamp the value between 0 and maxValue
    final clampedValue = sugarPer100g.clamp(0.0, maxValue);
    // Calculate position as percentage of bar width
    return (clampedValue / maxValue) * 300.0; // Assuming bar width of ~300px
  }
}

// Custom painter for the triangle indicator
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
