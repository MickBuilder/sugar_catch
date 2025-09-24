import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

class HowItWorksWidget extends ConsumerStatefulWidget {
  final VoidCallback? onNext;
  
  const HowItWorksWidget({super.key, this.onNext});

  @override
  ConsumerState<HowItWorksWidget> createState() => _HowItWorksWidgetState();
}

class _HowItWorksWidgetState extends ConsumerState<HowItWorksWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _featureAnimations;
  late List<Animation<Offset>> _featureSlideAnimations;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Create staggered animations for each feature
    _featureAnimations = List.generate(3, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          index * 0.3, // Start each animation 30% apart
          (index * 0.3) + 0.4, // Each animation takes 40% of total time
          curve: Curves.easeOutBack,
        ),
      ));
    });

    // Create slide animations for each feature
    _featureSlideAnimations = List.generate(3, (index) {
      return Tween<Offset>(
        begin: const Offset(0.3, 0.0), // Start from right
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          index * 0.3,
          (index * 0.3) + 0.4,
          curve: Curves.easeOutCubic,
        ),
      ));
    });

    // Start animation when widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startFeatureAnimations();
    });
  }

  void _startFeatureAnimations() async {
    // Start the animation
    _animationController.forward();
    
    // Add haptic feedback synchronized with each feature animation start
    // Animation starts: 0ms, 600ms, 1200ms (30% intervals of 2000ms)
    // Haptic feedback: 200ms, 800ms, 1400ms (200ms after each animation starts)
    
    await Future.delayed(Duration(milliseconds: 200)); // Feature 1
    HapticFeedback.lightImpact();
    
    await Future.delayed(Duration(milliseconds: 600)); // Wait for feature 2 animation start + 200ms
    HapticFeedback.lightImpact();
    
    await Future.delayed(Duration(milliseconds: 600)); // Wait for feature 3 animation start + 200ms
    HapticFeedback.lightImpact();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return OnboardingPageWidget(
      onNext: widget.onNext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Large image placeholder at the top
          Container(
            width: double.infinity,
            height: 280,
            margin: const EdgeInsets.only(bottom: 32),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0), // Light grey background
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                CupertinoIcons.photo,
                size: 60,
                color: Color(0xFFA0A0A0), // Medium grey icon
              ),
            ),
          ),

          // Title
          Text(
            'Scan. Reveal. Track.',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333), // Dark grey text
            ),
            textAlign: TextAlign.center,
          ),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Simply scan any product barcode to instantly see its hidden sugar content and get healthier alternatives.',
              style: const TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemGrey, // Dark grey text
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
         
         Spacer(),

          Column(
            children: [
              _buildAnimatedFeature(0, 'Instant sugar analysis', CupertinoIcons.search),
              const SizedBox(height: 16),
              _buildAnimatedFeature(1, 'Healthier alternatives', CupertinoIcons.heart),
              const SizedBox(height: 16),
              _buildAnimatedFeature(2, 'Track your daily intake', CupertinoIcons.chart_bar),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedFeature(int index, String text, IconData icon) {
    return SlideTransition(
      position: _featureSlideAnimations[index],
      child: FadeTransition(
        opacity: _featureAnimations[index],
        child: ScaleTransition(
          scale: _featureAnimations[index],
          child: _buildFeature(text, icon),
        ),
      ),
    );
  }

  Widget _buildFeature(String text, IconData icon) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2E0), // Light green background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF4CAF50), // Medium green border
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4CAF50), // Medium green icon
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF333333), // Dark grey text
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
