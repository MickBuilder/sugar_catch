import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:sweetr/features/onboarding/onboarding_provider.dart';
import 'package:sweetr/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

class TestimonialsWidget extends ConsumerStatefulWidget {
  final VoidCallback? onNext;
  
  const TestimonialsWidget({super.key, this.onNext});

  @override
  ConsumerState<TestimonialsWidget> createState() => _TestimonialsWidgetState();
}

class _TestimonialsWidgetState extends ConsumerState<TestimonialsWidget> {
  @override
  void initState() {
    super.initState();
    // Trigger in-app review when the testimonials screen loads
    _requestReview();
  }

  Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    
    // Check if the device supports in-app review
    if (await inAppReview.isAvailable()) {
      // Request the review
      await inAppReview.requestReview();
    }
  }

  @override
  Widget build(BuildContext context) {
    final testimonials = ref.watch(testimonialsProvider);

    return OnboardingPageWidget(
      onNext: widget.onNext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            'Spread the word',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Subtitle
          Text(
            'Sweetr is supported by and made for people like you',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),

          // Community Section
          const Text(
            'Sweetr is backed by people like you',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          // Community avatars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Overlapping avatars
              SizedBox(
                width: 120, // Fixed width for the stack (5 avatars * 20px overlap + 40px for last avatar)
                height: 40,
                child: Stack(
                  children: [
                    _buildCommunityAvatar('https://i.pravatar.cc/150?img=1', 0),
                    _buildCommunityAvatar('https://i.pravatar.cc/150?img=2', 1),
                    _buildCommunityAvatar('https://i.pravatar.cc/150?img=3', 2),
                    _buildCommunityAvatar('https://i.pravatar.cc/150?img=4', 3),
                    _buildCommunityAvatar('https://i.pravatar.cc/150?img=5', 4),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                '10,000+ community',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Testimonials
          SizedBox(
            height: 280,
            child: ListView.builder(
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black.withValues(alpha: .1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with title and stars
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              testimonial.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.black,
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(5, (index) => const Icon(
                              CupertinoIcons.star_fill,
                              color: Color(0xFFFFD700),
                              size: 16,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        testimonial.handle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Quote
                      Text(
                        '"${testimonial.quote}"',
                        style: const TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.black,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityAvatar(String imageUrl, int index) {
    return Positioned(
      left: index * 20.0, // Overlap by 20px
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: CupertinoColors.white,
            width: 2,
          ),
        ),
        child: ClipOval(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: CupertinoColors.systemGrey6,
                child: const Icon(
                  CupertinoIcons.person_fill,
                  color: CupertinoColors.systemGrey,
                  size: 20,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
