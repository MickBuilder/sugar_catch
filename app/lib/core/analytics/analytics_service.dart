import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'analytics_facade.dart';

/// Service for tracking analytics events throughout the app
/// This provides a simple interface for common analytics operations
class AnalyticsService {
  const AnalyticsService(this._analytics);
  final AnalyticsFacade _analytics;

  // Onboarding Events
  Future<void> trackOnboardingScreenViewed(int screenIndex, String screenName) async {
    await _analytics.trackOnboardingScreenViewed(screenIndex, screenName);
  }

  Future<void> trackOnboardingScreenCompleted(int screenIndex, int timeSpentMs) async {
    await _analytics.trackOnboardingScreenCompleted(screenIndex, timeSpentMs);
  }

  Future<void> trackOnboardingGoalSelected(String goalType) async {
    await _analytics.trackOnboardingGoalSelected(goalType);
  }

  Future<void> trackOnboardingMotivationSelected(List<String> motivations) async {
    await _analytics.trackOnboardingMotivationSelected(motivations);
  }

  Future<void> trackOnboardingCompleted(int totalTimeMs, String goalType, List<String> motivations) async {
    await _analytics.trackOnboardingCompleted(totalTimeMs, goalType, motivations);
  }

  // App Lifecycle Events
  Future<void> trackAppOpened(bool isFirstTime) async {
    await _analytics.trackAppOpened(isFirstTime);
  }

  Future<void> trackSessionStarted() async {
    await _analytics.trackSessionStarted();
  }

  Future<void> trackSessionEnded(int durationMs) async {
    await _analytics.trackSessionEnded(durationMs);
  }

  // Scanning Events
  Future<void> trackScanInitiated(String source) async {
    await _analytics.trackScanInitiated(source);
  }

  Future<void> trackScanSuccessful(String barcode, bool productFound, int scanDurationMs) async {
    await _analytics.trackScanSuccessful(barcode, productFound, scanDurationMs);
  }

  Future<void> trackScanFailed(String errorType, int retryCount) async {
    await _analytics.trackScanFailed(errorType, retryCount);
  }

  Future<void> trackManualSearchUsed(String searchTerm, bool resultsFound) async {
    await _analytics.trackManualSearchUsed(searchTerm, resultsFound);
  }

  // Product Analysis Events
  Future<void> trackProductViewed(String barcode, String productName, double sugarPer100g, String category) async {
    await _analytics.trackProductViewed(barcode, productName, sugarPer100g, category);
  }

  Future<void> trackProductAnalysisCompleted(int hiddenSugarsCount, int sweetenersCount, int additivesCount) async {
    await _analytics.trackProductAnalysisCompleted(hiddenSugarsCount, sweetenersCount, additivesCount);
  }

  Future<void> trackSugarLevelChecked(double sugarPer100g, String levelCategory) async {
    await _analytics.trackSugarLevelChecked(sugarPer100g, levelCategory);
  }

  // Daily Tracking Events
  Future<void> trackProductAddedToLog(String productName, double sugarContent, double servingSize) async {
    await _analytics.trackProductAddedToLog(productName, sugarContent, servingSize);
  }

  Future<void> trackDailyLogViewed(int totalEntries, double totalSugar, double goalProgress) async {
    await _analytics.trackDailyLogViewed(totalEntries, totalSugar, goalProgress);
  }

  Future<void> trackLogEntryRemoved(String productName, double sugarContent) async {
    await _analytics.trackLogEntryRemoved(productName, sugarContent);
  }

  Future<void> trackDailyGoalAchieved(String goalType, double actualSugar, double goalSugar) async {
    await _analytics.trackDailyGoalAchieved(goalType, actualSugar, goalSugar);
  }

  Future<void> trackDailyGoalExceeded(String goalType, double excessAmount) async {
    await _analytics.trackDailyGoalExceeded(goalType, excessAmount);
  }

  // Navigation Events
  Future<void> trackScreenViewed(String screenName, int timeSpentMs, String? previousScreen) async {
    await _analytics.trackScreenViewed(screenName, timeSpentMs, previousScreen);
  }

  Future<void> trackFeatureUsed(String featureName) async {
    await _analytics.trackFeatureUsed(featureName);
  }

  Future<void> trackTabSwitched(String fromTab, String toTab, int timeOnPreviousTab) async {
    await _analytics.trackTabSwitched(fromTab, toTab, timeOnPreviousTab);
  }

  // Recommendations Events
  Future<void> trackRecommendationsViewed(String productCategory, int recommendationsCount) async {
    await _analytics.trackRecommendationsViewed(productCategory, recommendationsCount);
  }

  Future<void> trackRecommendationClicked(String recommendationProduct, int position) async {
    await _analytics.trackRecommendationClicked(recommendationProduct, position);
  }

  Future<void> trackAlternativeSelected(String originalProduct, String alternativeProduct) async {
    await _analytics.trackAlternativeSelected(originalProduct, alternativeProduct);
  }

  // Error Events
  Future<void> trackApiError(String errorType, String barcode, int retryCount) async {
    await _analytics.trackApiError(errorType, barcode, retryCount);
  }

  Future<void> trackScanError(String errorType, bool cameraPermission, int retryCount) async {
    await _analytics.trackScanError(errorType, cameraPermission, retryCount);
  }

  Future<void> trackProductNotFound(String barcode, int searchAttempts) async {
    await _analytics.trackProductNotFound(barcode, searchAttempts);
  }

  // User Properties
  Future<void> setUserProperty(String key, dynamic value) async {
    await _analytics.setUserProperty(key, value);
  }

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(userId);
  }
}

/// Provider for analytics service
final analyticsServiceProvider = FutureProvider<AnalyticsService>((ref) async {
  final analyticsFacade = await ref.watch(analyticsFacadeProvider.future);
  return AnalyticsService(analyticsFacade);
});
