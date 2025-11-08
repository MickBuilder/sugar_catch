import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

/// Custom painter for happy face illustration
class HappyFacePainter extends material.CustomPainter {
  @override
  void paint(material.Canvas canvas, material.Size size) {
    final center = material.Offset(size.width / 2, size.height / 2);
    final paint = material.Paint()..style = material.PaintingStyle.fill;
    
    // Draw face circle
    paint.color = const Color(0xFFFFF5E6);
    canvas.drawCircle(center, size.width / 2, paint);
    
    // Draw closed eyes (curved lines)
    paint.color = CupertinoColors.black;
    paint.style = material.PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.strokeCap = material.StrokeCap.round;
    
    // Left eye (closed, curved)
    final leftEyePath = material.Path();
    leftEyePath.moveTo(center.dx - 20, center.dy - 10);
    leftEyePath.quadraticBezierTo(center.dx - 15, center.dy - 5, center.dx - 10, center.dy - 10);
    canvas.drawPath(leftEyePath, paint);
    
    // Right eye (closed, curved)
    final rightEyePath = material.Path();
    rightEyePath.moveTo(center.dx + 10, center.dy - 10);
    rightEyePath.quadraticBezierTo(center.dx + 15, center.dy - 5, center.dx + 20, center.dy - 10);
    canvas.drawPath(rightEyePath, paint);
    
    // Draw smile
    final smilePath = material.Path();
    smilePath.moveTo(center.dx - 25, center.dy + 5);
    smilePath.quadraticBezierTo(center.dx, center.dy + 20, center.dx + 25, center.dy + 5);
    canvas.drawPath(smilePath, paint);
    
    // Draw rosy cheeks
    paint.color = const Color(0xFFFFB6C1);
    paint.style = material.PaintingStyle.fill;
    canvas.drawCircle(material.Offset(center.dx - 30, center.dy + 5), 8, paint);
    canvas.drawCircle(material.Offset(center.dx + 30, center.dy + 5), 8, paint);
  }
  
  @override
  bool shouldRepaint(material.CustomPainter oldDelegate) => false;
}

class GetStartedWidget extends StatelessWidget {
  final VoidCallback? onNext;
  
  const GetStartedWidget({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    // Calculate date 30 days from now
    final futureDate = DateTime.now().add(const Duration(days: 30));
    final formattedDate = _formatDate(futureDate);

    return OnboardingPageWidget(
      onNext: onNext,
      ctaText: 'Get started',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Teal-green card with checkmark
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // White checkmark icon in circle
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.check_mark,
                    color: CupertinoColors.systemGreen,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 20),
                
                // "You can be free of processed foods by:"
                const Text(
                  'You can be free of processed foods by:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                
                // Date button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGreen.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CupertinoColors.white.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // "#1 Processed Food Scanner" with laurel leaves and stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left laurel leaf
              HugeIcon(
                icon: HugeIcons.strokeRoundedLeaf01,
                color: CupertinoColors.systemGreen,
                size: 20,
              ),
              const SizedBox(width: 8),
              
              // "#1 Processed Food Scanner" text
              const Text(
                '#1 Processed Food Scanner',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemGreen,
                ),
              ),
              
              const SizedBox(width: 8),
              // Right laurel leaf
              HugeIcon(
                icon: HugeIcons.strokeRoundedLeaf01,
                color: CupertinoColors.systemGreen,
                size: 20,
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // 5 gold stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Icon(
                CupertinoIcons.star_fill,
                color: Color(0xFFFFD700),
                size: 20,
              ),
            )),
          ),
          
          const SizedBox(height: 32),
          
          // Character illustration with plus signs
          SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Character illustration - happy face with rosy cheeks
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF5E6), // Light beige/peach background
                    shape: BoxShape.circle,
                  ),
                  child: CustomPaint(
                    painter: HappyFacePainter(),
                  ),
                ),                
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Motivational text
          const Text(
            'Stronger, healthier, happier.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Lose weight, reduce anxiety and become the best version of yourself.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.black,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    
    final day = date.day;
    final month = months[date.month - 1];
    final year = date.year;
    
    // Add ordinal suffix
    String daySuffix;
    if (day >= 11 && day <= 13) {
      daySuffix = 'th';
    } else {
      switch (day % 10) {
        case 1:
          daySuffix = 'st';
          break;
        case 2:
          daySuffix = 'nd';
          break;
        case 3:
          daySuffix = 'rd';
          break;
        default:
          daySuffix = 'th';
      }
    }
    
    return '$day$daySuffix $month $year';
  }
}

