import 'package:flutter/material.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';

class SugarIngredientCard extends StatelessWidget {
  final Ingredient ingredient;
  final double dailyLimitMultiplier;
  final bool isSugarIngredient;

  const SugarIngredientCard({
    super.key,
    required this.ingredient,
    required this.dailyLimitMultiplier,
    this.isSugarIngredient = true,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isSugarIngredient ? Colors.red[300]! : Colors.grey[300]!;
    final badgeColor = isSugarIngredient ? Colors.red[600]! : Colors.grey[600]!;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with name and badge - EXACT Oasis layout
          Row(
            children: [
              Expanded(
                child: Text(
                  ingredient.textEn ?? ingredient.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              if (isSugarIngredient && dailyLimitMultiplier > 1) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${dailyLimitMultiplier.toInt()}x limit',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          // Amount (like "0.0023 mg/L" in the image)
          Text(
            _getIngredientAmount(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          // Description
          Text(
            _getIngredientDescription(ingredient.textEn ?? ingredient.text),
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _getIngredientAmount() {
    // Estimate the amount based on percentage if available
    if (ingredient.percentEstimate != null) {
      return '${ingredient.percentEstimate!.toStringAsFixed(1)}%';
    }
    if (ingredient.percentMax != null) {
      return 'up to ${ingredient.percentMax!.toStringAsFixed(1)}%';
    }
    if (ingredient.percentMin != null) {
      return 'at least ${ingredient.percentMin!.toStringAsFixed(1)}%';
    }
    return 'Amount not specified';
  }

  String _getIngredientDescription(String ingredientName) {
    final name = ingredientName.toLowerCase();
    
    if (isSugarIngredient) {
      // Sugar descriptions
    if (name.contains('cane sugar') || name.contains('sugar cane')) {
      return 'Cane sugar is a refined sweetener extracted from sugar cane. It provides empty calories with no nutritional value and can contribute to weight gain, diabetes, and tooth decay when consumed in excess.';
    }
    if (name.contains('high fructose corn syrup') || name.contains('hfcs')) {
      return 'High fructose corn syrup is a highly processed sweetener made from corn starch. It has been linked to obesity, diabetes, and liver damage due to its high fructose content and how it\'s metabolized by the body.';
    }
    if (name.contains('honey')) {
      return 'Honey is a natural sweetener produced by bees. While it contains some antioxidants and trace minerals, it\'s still high in sugar and should be consumed in moderation. It can raise blood sugar levels similar to regular sugar.';
    }
    if (name.contains('molasses')) {
      return 'Molasses is a byproduct of sugar refining that contains some minerals like iron and calcium. However, it\'s still primarily sugar and should be consumed sparingly as part of a balanced diet.';
    }
    if (name.contains('brown rice syrup')) {
      return 'Brown rice syrup is made by breaking down brown rice starch into sugars. While it may seem healthier than regular sugar, it\'s still a concentrated sweetener that can spike blood sugar levels.';
    }
    if (name.contains('agave')) {
      return 'Agave syrup is derived from the agave plant and is often marketed as a natural alternative to sugar. However, it\'s very high in fructose and can be more harmful to liver health than regular sugar.';
    }
    if (name.contains('maple syrup')) {
      return 'Maple syrup is made from the sap of maple trees and contains some antioxidants and minerals. While it\'s a more natural option, it\'s still high in sugar and should be used in moderation.';
    }
    if (name.contains('coconut sugar')) {
      return 'Coconut sugar is made from the sap of coconut palm trees. It has a lower glycemic index than regular sugar and contains some nutrients, but it\'s still primarily sugar and should be consumed sparingly.';
    }
    if (name.contains('dextrose')) {
      return 'Dextrose is a simple sugar derived from corn that\'s chemically identical to glucose. It\'s rapidly absorbed into the bloodstream and can cause blood sugar spikes, making it problematic for people with diabetes.';
    }
    if (name.contains('fructose')) {
      return 'Fructose is a natural sugar found in fruits, but when isolated and added to foods, it can contribute to insulin resistance, fatty liver disease, and metabolic syndrome when consumed in excess.';
    }
    if (name.contains('glucose')) {
      return 'Glucose is a simple sugar that\'s the primary energy source for cells. While essential for life, added glucose in processed foods can cause rapid blood sugar spikes and contribute to insulin resistance.';
    }
    if (name.contains('sucrose')) {
      return 'Sucrose is table sugar, composed of glucose and fructose. It provides empty calories with no nutritional value and can contribute to weight gain, diabetes, and tooth decay when consumed in excess.';
    }
    if (name.contains('lactose')) {
      return 'Lactose is the natural sugar found in milk and dairy products. While it\'s a natural component of dairy, some people are intolerant to lactose and may experience digestive issues when consuming it.';
    }
    if (name.contains('maltose')) {
      return 'Maltose is a sugar formed from two glucose molecules, commonly found in malted foods and some processed products. It can cause rapid blood sugar spikes similar to other simple sugars.';
    }
    
    // Generic description for other sugars
    return 'This is a form of added sugar that provides empty calories with no nutritional value. Regular consumption of added sugars can contribute to weight gain, diabetes, heart disease, and tooth decay. It\'s recommended to limit added sugar intake to less than 10% of daily calories.';
    } else {
      // Non-sugar ingredient descriptions
      if (name.contains('water')) {
        return 'Water is essential for life and makes up a significant portion of many food products. It helps maintain proper hydration and is calorie-free.';
      } else if (name.contains('salt')) {
        return 'Salt (sodium chloride) is used as a flavor enhancer and preservative. Excessive sodium intake can contribute to high blood pressure and cardiovascular disease.';
      } else if (name.contains('oil')) {
        return 'Oils are fats that are liquid at room temperature. They provide energy and essential fatty acids, but should be consumed in moderation due to their high calorie content.';
      } else if (name.contains('flour')) {
        return 'Flour is a powder made from ground grains, typically wheat. It\'s a staple ingredient in baking and provides carbohydrates and some protein.';
      } else if (name.contains('milk')) {
        return 'Milk is a nutrient-rich liquid produced by mammals. It provides protein, calcium, and other essential nutrients, but may cause issues for those with lactose intolerance.';
      } else if (name.contains('egg')) {
        return 'Eggs are a complete protein source containing all essential amino acids. They also provide vitamins, minerals, and healthy fats.';
      } else if (name.contains('butter')) {
        return 'Butter is a dairy product made from cream. It\'s high in saturated fat and calories, so it should be consumed in moderation.';
      } else if (name.contains('vanilla')) {
        return 'Vanilla is a flavoring derived from vanilla beans. It adds a sweet, aromatic flavor to foods without adding significant calories or sugar.';
      } else if (name.contains('cocoa') || name.contains('chocolate')) {
        return 'Cocoa and chocolate are derived from cacao beans. Dark chocolate contains antioxidants and flavonoids, but milk chocolate often contains added sugars.';
      } else if (name.contains('fruit')) {
        return 'Fruits are naturally sweet and contain vitamins, minerals, fiber, and antioxidants. They provide natural sugars along with beneficial nutrients.';
      } else if (name.contains('vegetable')) {
        return 'Vegetables are low in calories and high in vitamins, minerals, and fiber. They provide essential nutrients and are an important part of a healthy diet.';
      } else if (name.contains('spice') || name.contains('herb')) {
        return 'Spices and herbs add flavor to foods without adding calories or sugar. Many contain beneficial compounds and antioxidants.';
      } else if (name.contains('preservative')) {
        return 'Preservatives are added to foods to extend shelf life and prevent spoilage. Some may cause allergic reactions in sensitive individuals.';
      } else if (name.contains('emulsifier')) {
        return 'Emulsifiers help mix ingredients that don\'t normally combine well, like oil and water. They improve texture and stability in processed foods.';
      } else if (name.contains('stabilizer')) {
        return 'Stabilizers help maintain the texture and consistency of foods. They prevent separation and maintain quality during storage.';
      } else if (name.contains('thickener')) {
        return 'Thickeners increase the viscosity of foods, improving texture and mouthfeel. They can be natural or synthetic.';
      } else if (name.contains('color') || name.contains('dye')) {
        return 'Food colors and dyes are added to enhance or restore the appearance of foods. Some artificial colors may cause allergic reactions in sensitive individuals.';
      } else if (name.contains('flavor') || name.contains('essence')) {
        return 'Flavors and essences are added to enhance or create specific tastes in foods. They can be natural or artificial.';
      } else if (name.contains('acid')) {
        return 'Acids are added to foods for flavor enhancement, preservation, or pH adjustment. Common food acids include citric acid, acetic acid, and lactic acid.';
      } else if (name.contains('vitamin') || name.contains('mineral')) {
        return 'Vitamins and minerals are essential nutrients that support various bodily functions. They may be added to foods to enhance nutritional value.';
      }
      
      return 'This ingredient is part of the product formulation. For specific health information, consult with a healthcare professional or nutritionist.';
    }
  }
}
