import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';

class AllergyDietSection extends StatelessWidget {
  final Product product;

  const AllergyDietSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final allergens = _getAllergens();
    final dietInfo = _getDietInfo();

    if (allergens.isEmpty && dietInfo.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Allergy & Diet info',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
          const SizedBox(height: 12),
          
          // Allergens
          if (allergens.isNotEmpty) ...[
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: allergens.map((allergen) => _buildAllergenTag(allergen)).toList(),
              ),
            ),
            if (dietInfo.isNotEmpty) const SizedBox(height: 12),
          ],
          
          // Diet info (vegan, vegetarian, gluten-free, etc.)
          if (dietInfo.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: dietInfo.map((diet) => _buildDietTag(diet)).toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAllergenTag(String allergen) {
    final allergenData = _parseAllergen(allergen);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemRed.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CupertinoColors.systemRed.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(
            icon: allergenData['icon'],
            size: 16,
            color: CupertinoColors.systemRed,
          ),
          const SizedBox(width: 6),
          Text(
            allergenData['displayName'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CupertinoColors.systemRed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDietTag(String diet) {
    final dietData = _parseDietInfo(diet);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CupertinoColors.systemGreen.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(
            icon: dietData['icon'],
            size: 16,
            color: CupertinoColors.systemGreen,
          ),
          const SizedBox(width: 6),
          Text(
            dietData['displayName'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CupertinoColors.systemGreen,
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getAllergens() {
    final allergens = <String>[];
    
    // Get from allergens_tags
    if (product.allergensTags != null) {
      allergens.addAll(product.allergensTags!);
    }
    
    // Get from traces_tags (may contain allergens)
    if (product.tracesTags != null) {
      final traceAllergens = product.tracesTags!.where((trace) => 
        _isAllergen(trace)
      ).toList();
      allergens.addAll(traceAllergens);
    }
    
    // Remove duplicates and clean up
    return allergens.map((a) => a.toLowerCase()).toSet().toList();
  }

  List<String> _getDietInfo() {
    final dietInfo = <String>[];
    
    // Get from labels_tags
    if (product.labelsTags != null) {
      final dietLabels = product.labelsTags!.where((label) => 
        _isDietLabel(label)
      ).toList();
      dietInfo.addAll(dietLabels);
    }
    
    // Check ingredients for vegan/vegetarian
    if (product.ingredientsList != null && product.ingredientsList!.isNotEmpty) {
      final hasVegan = product.ingredientsList!.every((ing) => 
        ing.vegan != 'no' && ing.fromPalmOil != 'yes'
      );
      final hasVegetarian = product.ingredientsList!.every((ing) => 
        ing.vegetarian != 'no'
      );
      
      if (hasVegan && !dietInfo.any((d) => d.toLowerCase().contains('vegan'))) {
        dietInfo.add('en:vegan');
      }
      if (hasVegetarian && !dietInfo.any((d) => d.toLowerCase().contains('vegetarian'))) {
        dietInfo.add('en:vegetarian');
      }
    }
    
    return dietInfo;
  }

  bool _isAllergen(String tag) {
    final lower = tag.toLowerCase();
    final allergens = [
      'nuts', 'peanut', 'gluten', 'wheat', 'dairy', 'milk', 'egg', 
      'soy', 'fish', 'shellfish', 'sesame', 'mustard', 'celery', 
      'lupin', 'sulfite', 'sulphite'
    ];
    return allergens.any((a) => lower.contains(a));
  }

  bool _isDietLabel(String label) {
    final lower = label.toLowerCase();
    final dietLabels = [
      'vegan', 'vegetarian', 'gluten-free', 'organic', 'kosher', 
      'halal', 'palm-oil-free', 'no-preservatives', 'no-additives'
    ];
    return dietLabels.any((d) => lower.contains(d.replaceAll('-', '')));
  }

  Map<String, dynamic> _parseAllergen(String allergen) {
    final lower = allergen.toLowerCase();
    
    if (lower.contains('nut') || lower.contains('peanut')) {
      return {
        'icon': HugeIcons.strokeRoundedStar,
        'displayName': 'Nuts',
      };
    } else if (lower.contains('gluten') || lower.contains('wheat')) {
      return {
        'icon': HugeIcons.strokeRoundedGitBranch,
        'displayName': 'Gluten',
      };
    } else if (lower.contains('dairy') || lower.contains('milk')) {
      return {
        'icon': HugeIcons.strokeRoundedDroplet,
        'displayName': 'Dairy',
      };
    } else if (lower.contains('egg')) {
      return {
        'icon': HugeIcons.strokeRoundedCircle,
        'displayName': 'Eggs',
      };
    } else if (lower.contains('soy')) {
      return {
        'icon': HugeIcons.strokeRoundedSquare,
        'displayName': 'Soy',
      };
    } else if (lower.contains('fish') || lower.contains('shellfish')) {
      return {
        'icon': HugeIcons.strokeRoundedSoundcloud,
        'displayName': 'Fish',
      };
    } else if (lower.contains('sesame')) {
      return {
        'icon': HugeIcons.strokeRoundedCircle,
        'displayName': 'Sesame',
      };
    }
    
    // Default: capitalize and clean up
    String displayName = allergen.replaceAll('en:', '').replaceAll('-', ' ');
    displayName = displayName.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
    
    return {
      'icon': HugeIcons.strokeRoundedAlert02,
      'displayName': displayName,
    };
  }

  Map<String, dynamic> _parseDietInfo(String diet) {
    final lower = diet.toLowerCase();
    
    if (lower.contains('vegan')) {
      return {
        'icon': HugeIcons.strokeRoundedLeaf01,
        'displayName': 'Vegan',
      };
    } else if (lower.contains('vegetarian')) {
      return {
        'icon': HugeIcons.strokeRoundedCheckmarkCircle01,
        'displayName': 'Vegetarian',
      };
    } else if (lower.contains('gluten') && lower.contains('free')) {
      return {
        'icon': HugeIcons.strokeRoundedCheckmarkCircle01,
        'displayName': 'Gluten-Free',
      };
    } else if (lower.contains('organic')) {
      return {
        'icon': HugeIcons.strokeRoundedLeaf01,
        'displayName': 'Organic',
      };
    }
    
    // Default: capitalize and clean up
    String displayName = diet.replaceAll('en:', '').replaceAll('-', ' ');
    displayName = displayName.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
    
    return {
      'icon': HugeIcons.strokeRoundedInformationCircle,
      'displayName': displayName,
    };
  }
}

