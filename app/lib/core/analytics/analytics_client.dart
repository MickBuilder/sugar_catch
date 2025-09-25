/// Abstract interface for analytics clients
/// This allows us to swap implementations without changing app code
abstract class AnalyticsClient {
  // Onboarding Events
  Future<void> trackOnboardingScreenViewed(int screenIndex, String screenName);
  Future<void> trackOnboardingScreenCompleted(int screenIndex, int timeSpentMs);
  Future<void> trackOnboardingGoalSelected(String goalType);
  Future<void> trackOnboardingMotivationSelected(List<String> motivations);
  Future<void> trackOnboardingCompleted(int totalTimeMs, String goalType, List<String> motivations);

  // App Lifecycle Events
  Future<void> trackAppOpened(bool isFirstTime);
  Future<void> trackSessionStarted();
  Future<void> trackSessionEnded(int durationMs);

  // Scanning Events
  Future<void> trackScanInitiated(String source);
  Future<void> trackScanSuccessful(String barcode, bool productFound, int scanDurationMs);
  Future<void> trackScanFailed(String errorType, int retryCount);
  Future<void> trackManualSearchUsed(String searchTerm, bool resultsFound);

  // Product Analysis Events
  Future<void> trackProductViewed(String barcode, String productName, double sugarPer100g, String category);
  Future<void> trackProductAnalysisCompleted(int hiddenSugarsCount, int sweetenersCount, int additivesCount);
  Future<void> trackSugarLevelChecked(double sugarPer100g, String levelCategory);

  // Daily Tracking Events
  Future<void> trackProductAddedToLog(String productName, double sugarContent, double servingSize);
  Future<void> trackDailyLogViewed(int totalEntries, double totalSugar, double goalProgress);
  Future<void> trackLogEntryRemoved(String productName, double sugarContent);
  Future<void> trackDailyGoalAchieved(String goalType, double actualSugar, double goalSugar);
  Future<void> trackDailyGoalExceeded(String goalType, double excessAmount);

  // Navigation Events
  Future<void> trackScreenViewed(String screenName, int timeSpentMs, String? previousScreen);
  Future<void> trackFeatureUsed(String featureName);
  Future<void> trackTabSwitched(String fromTab, String toTab, int timeOnPreviousTab);

  // Recommendations Events
  Future<void> trackRecommendationsViewed(String productCategory, int recommendationsCount);
  Future<void> trackRecommendationClicked(String recommendationProduct, int position);
  Future<void> trackAlternativeSelected(String originalProduct, String alternativeProduct);

  // Error Events
  Future<void> trackApiError(String errorType, String barcode, int retryCount);
  Future<void> trackScanError(String errorType, bool cameraPermission, int retryCount);
  Future<void> trackProductNotFound(String barcode, int searchAttempts);

  // User Properties
  Future<void> setUserProperty(String key, dynamic value);
  Future<void> setUserId(String userId);
}
