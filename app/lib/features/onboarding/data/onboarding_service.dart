import 'dart:developer';
import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:cleanfood/features/onboarding/data/onboarding_models.dart';

class OnboardingService {
  static const String _onboardingBoxName = 'onboarding';
  static Box<String>? _onboardingBox;

  static Future<void> init() async {
    _onboardingBox = await Hive.openBox<String>(_onboardingBoxName);
  }

  static Future<void> saveOnboardingData(OnboardingData data) async {
    if (_onboardingBox != null) {
      final jsonString = jsonEncode(data.toJson());
      await _onboardingBox!.put('onboarding_data', jsonString);
      log('💾 [OnboardingService] Saved onboarding data: ${data.toJson}', name: 'Onboarding');
    }
  }

  static OnboardingData getOnboardingData() {
    if (_onboardingBox != null) {
      final jsonString = _onboardingBox!.get('onboarding_data');
      if (jsonString != null) {
        try {
          final json = jsonDecode(jsonString) as Map<String, dynamic>;
          return OnboardingData.fromJson(json);
        } catch (e) {
          log('💾 [OnboardingService] Error parsing onboarding data: $e', name: 'Onboarding');
        }
      }
    }
    return const OnboardingData();
  }

  static Future<void> markOnboardingComplete() async {
    if (_onboardingBox != null) {
      final currentData = getOnboardingData();
      final updatedData = currentData.copyWith(hasCompletedOnboarding: true);
      await saveOnboardingData(updatedData);
      log('💾 [OnboardingService] Marked onboarding as complete', name: 'Onboarding');
    }
  }

  static bool hasCompletedOnboarding() {
    return getOnboardingData().hasCompletedOnboarding;
  }

  static Future<void> clearOnboardingData() async {
    if (_onboardingBox != null) {
      await _onboardingBox!.clear();
      log('💾 [OnboardingService] Cleared onboarding data', name: 'Onboarding');
    }
  }

  static Future<void> resetOnboardingStatus() async {
    if (_onboardingBox != null) {
      await _onboardingBox!.delete('onboarding_data');
      log('💾 [OnboardingService] Reset onboarding status', name: 'Onboarding');
    }
  }

  // Testimonials data
  static List<Testimonial> getTestimonials() {
    return const [
      Testimonial(
        name: 'Sarah M.',
        handle: '@sarah_m',
        quote: 'I\'ll never buy groceries without scanning them with Flean first. I\'m shocked by how processed everything is.',
        beforeAfter: '10,000+ scans',
      ),
      Testimonial(
        name: 'Mike H.',
        handle: '@mike_health',
        quote: 'Finally an app that shows me what\'s actually in my food—especially the processing level. Game changer.',
        beforeAfter: '5,000+ products',
      ),
      Testimonial(
        name: 'Jenny F.',
        handle: '@jenny_fit',
        quote: 'I had no idea how many weird additives and chemicals were in foods I thought were healthy.',
        beforeAfter: '700+ additives',
      ),
    ];
  }
}
