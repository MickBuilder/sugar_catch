import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';
import 'package:cleanfood/core/services/additives_service.dart';
import 'package:cleanfood/core/services/additive_risk_service.dart';

class AdditivesSection extends HookWidget {
  final Product product;

  const AdditivesSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Hooks MUST be called unconditionally at the top
    final additiveNames = useState<Map<String, String>>({});
    final isLoading = useState<bool>(true);
    
    final additives = product.additivesTags ?? [];

    useEffect(() {
      if (additives.isNotEmpty) {
        _loadAdditiveNames(additives, additiveNames, isLoading);
      } else {
        isLoading.value = false;
      }
      return null;
    }, [additives.join(',')]);
    
    if (additives.isEmpty) {
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
        children: [
          const Text(
            'Additives',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
          ),
          const SizedBox(height: 12),
          
          if (isLoading.value)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CupertinoActivityIndicator(),
            )
          else
            ...additives.map((additive) {
              final eCode = _extractECode(additive);
              final name = additiveNames.value[additive] ?? _getFallbackName(additive);
              final risk = AdditiveRiskService.getRiskLevel(additive);
              
              return _buildAdditiveItem(name, eCode, risk);
            }),
        ],
      ),
    );
  }

  Future<void> _loadAdditiveNames(
    List<String> additives,
    ValueNotifier<Map<String, String>> namesNotifier,
    ValueNotifier<bool> loadingNotifier,
  ) async {
    try {
      loadingNotifier.value = true;
    } catch (e) {
      return; // Widget disposed, don't continue
    }
    
    final namesMap = <String, String>{};
    
    for (final additive in additives) {
      try {
        // Ensure tag format is correct for the service
        String tag = additive;
        if (!tag.startsWith('en:')) {
          // If tag doesn't start with 'en:', add it
          final eCodeMatch = RegExp(r'e\d+[a-z]*', caseSensitive: false)
              .firstMatch(tag.toLowerCase());
          if (eCodeMatch != null) {
            tag = 'en:${eCodeMatch.group(0)}';
          } else {
            tag = 'en:$tag';
          }
        }
        
        final name = await AdditivesService.getAdditiveName(tag);
        // Only use the name if it's not empty and not just the E-code
        if (name.isNotEmpty && !name.startsWith('E') && !RegExp(r'^E\d+').hasMatch(name)) {
          namesMap[additive] = name;
        } else {
          namesMap[additive] = _getFallbackName(additive);
        }
      } catch (e) {
        namesMap[additive] = _getFallbackName(additive);
      }
    }
    
    // Try to update notifiers, catch disposed errors
    try {
      namesNotifier.value = namesMap;
      loadingNotifier.value = false;
    } catch (e) {
      // Widget disposed, ignore
    }
  }

  String _extractECode(String additive) {
    // Extract E-number code if present (e.g., e170, e170i, e340, e340ii)
    final cleaned = additive.toLowerCase();
    final eNumberMatch = RegExp(r'e\d+[a-z]*', caseSensitive: false)
        .firstMatch(cleaned);
    
    if (eNumberMatch != null) {
      return eNumberMatch.group(0)!.toLowerCase();
    }
    
    return '';
  }

  String _getFallbackName(String additive) {
    // Fallback name if service fails
    String cleaned = additive.replaceAll('en:', '').replaceAll('-', ' ');
    
    // Remove E-number if present
    cleaned = cleaned.replaceAll(RegExp(r'e\d+[a-z]*', caseSensitive: false), '').trim();
    
    // Capitalize first letter of each word
    if (cleaned.isEmpty) {
      // If no name found, try to extract from tag format
      cleaned = additive.replaceAll('en:', '').replaceAll('-', ' ');
    }
    
    return cleaned.split(' ').where((word) => word.isNotEmpty).map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }


  Widget _buildAdditiveItem(String name, String code, String risk) {
    // Get color based on risk level (matching Yuka's color scheme)
    final dotColor = _getRiskColor(risk);

    // Format: "Name (eNumber)" or just "Name" if no code
    final displayText = code.isNotEmpty ? '$name ($code)' : name;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          // TODO: Show additive details
        },
        child: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.label,
                ),
              ),
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              size: 18,
              color: CupertinoColors.systemGrey,
            ),
          ],
        ),
      ),
    );
  }

  /// Get color for risk level (matching Yuka's color scheme)
  Color _getRiskColor(String risk) {
    switch (risk) {
      case 'high':
        return CupertinoColors.systemRed; // Red dot for high-risk
      case 'moderate':
        return CupertinoColors.systemOrange; // Orange dot for moderate-risk
      case 'limited':
        return const Color(0xFFFFC107); // Yellow/amber dot for limited-risk
      case 'risk-free':
      default:
        return CupertinoColors.systemGreen; // Green dot for risk-free
    }
  }

}

