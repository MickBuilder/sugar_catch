import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';
import 'package:sugar_catch/features/scan/data/recommendations_service.dart';

class RecommendationsWidget extends StatefulWidget {
  final Product product;

  const RecommendationsWidget({
    super.key,
    required this.product,
  });

  @override
  State<RecommendationsWidget> createState() => _RecommendationsWidgetState();
}

class _RecommendationsWidgetState extends State<RecommendationsWidget> {
  List<Product> _recommendations = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadRecommendations();
  }

  Future<void> _loadRecommendations() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });
      
      final recommendations = await RecommendationsService.getLowSugarAlternatives(
        widget.product,
      );
      
      setState(() {
        _recommendations = recommendations;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Don't show recommendations section if no recommendations are needed
    if (!_isLoading && _error == null && _recommendations.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Recommendations header
        const Text(
          'Low-Sugar Alternatives',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 12),

        // Recommendations list
        SizedBox(
          height: 180,
          child: _buildRecommendationsList(),
        ),

      ],
    );
  }

  Widget _buildRecommendationsList() {
    if (_isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(radius: 15),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.exclamationmark_triangle,
              size: 32,
              color: CupertinoColors.systemRed,
            ),
            const SizedBox(height: 8),
            const Text(
              'Failed to load recommendations',
              style: TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemRed,
              ),
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _loadRecommendations,
              child: const Text(
                'Retry',
                style: TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.systemBlue,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_recommendations.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.checkmark_circle,
              size: 32,
              color: CupertinoColors.systemGreen,
            ),
            SizedBox(height: 8),
            Text(
              'Great choice!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.systemGreen,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'This product has low sugar content',
              style: TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _recommendations.length,
      itemBuilder: (context, index) {
        final recommendation = _recommendations[index];
        return _buildRecommendationCard(context, recommendation);
      },
    );
  }

  Widget _buildRecommendationCard(BuildContext context, Product recommendation) {
    print('🎨 [RecommendationsWidget] Building card for: ${recommendation.productName}');
    print('🎨 [RecommendationsWidget] Brand: ${recommendation.brands}');
    print('🎨 [RecommendationsWidget] Image URL: ${recommendation.imageUrl}');
    print('🎨 [RecommendationsWidget] Sugar: ${recommendation.sugarsPer100g}g/100${recommendation.productQuantityUnit}');
    
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          // Navigate to product screen for this recommendation
          context.go('/product/${recommendation.code}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                color: CupertinoColors.systemGrey6,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  recommendation.imageUrl ?? '',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CupertinoActivityIndicator(radius: 10),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: CupertinoColors.systemGrey6,
                      child: const Icon(
                        CupertinoIcons.photo,
                        size: 24,
                        color: CupertinoColors.systemGrey,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Product info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      recommendation.productName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),

                    // Brand
                    Text(
                      recommendation.brands ?? 'Unknown Brand',
                      style: const TextStyle(
                        fontSize: 10,
                        color: CupertinoColors.systemGrey,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Sugar content
                    Row(
                      children: [
                        // Sugar content indicator
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _getSugarColor(recommendation.sugarsPer100g, recommendation.productQuantityUnit ?? 'g'),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Sugar content text
                        Expanded(
                          child: Text(
                            '${recommendation.sugarsPer100g.toStringAsFixed(1)}g sugar/100${recommendation.productQuantityUnit ?? 'g'}',
                            style: TextStyle(
                              fontSize: 10,
                              color: _getSugarColor(recommendation.sugarsPer100g, recommendation.productQuantityUnit ?? 'g'),
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get color based on sugar content
  Color _getSugarColor(double sugarPer100g, String unit) {
    if (unit.toLowerCase() == 'ml') {
      // For beverages (ml)
      if (sugarPer100g <= 1.5) return CupertinoColors.systemGreen;
      if (sugarPer100g <= 3.0) return CupertinoColors.systemGreen;
      if (sugarPer100g <= 5.0) return CupertinoColors.systemOrange;
      if (sugarPer100g <= 7.0) return CupertinoColors.systemOrange;
      if (sugarPer100g <= 10.0) return CupertinoColors.systemRed;
      return CupertinoColors.systemRed;
    } else {
      // For solid foods (g)
      if (sugarPer100g <= 5.0) return CupertinoColors.systemGreen;
      if (sugarPer100g <= 10.0) return CupertinoColors.systemGreen;
      if (sugarPer100g <= 15.0) return CupertinoColors.systemOrange;
      if (sugarPer100g <= 20.0) return CupertinoColors.systemOrange;
      if (sugarPer100g <= 25.0) return CupertinoColors.systemRed;
      return CupertinoColors.systemRed;
    }
  }

}
