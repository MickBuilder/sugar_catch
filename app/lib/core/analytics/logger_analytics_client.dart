import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'analytics_client.dart';

/// Debug implementation that logs events to console
/// Used in development mode to avoid sending events to Mixpanel
class LoggerAnalyticsClient implements AnalyticsClient {
  const LoggerAnalyticsClient();

  @override
  Future<void> trackOnboardingScreenViewed(int screenIndex, String screenName) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] onboarding_screen_viewed: screenIndex=$screenIndex, screenName=$screenName', name: 'Analytics');
    }
  }

  @override
  Future<void> trackOnboardingScreenCompleted(int screenIndex, int timeSpentMs) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] onboarding_screen_completed: screenIndex=$screenIndex, timeSpentMs=$timeSpentMs', name: 'Analytics');
    }
  }

  @override
  Future<void> trackOnboardingGoalSelected(String goalType) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] onboarding_goal_selected: goalType=$goalType', name: 'Analytics');
    }
  }

  @override
  Future<void> trackOnboardingMotivationSelected(List<String> motivations) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] onboarding_motivation_selected: motivations=${motivations.join(', ')}', name: 'Analytics');
    }
  }

  @override
  Future<void> trackOnboardingCompleted(int totalTimeMs, String goalType, List<String> motivations) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] onboarding_completed: totalTimeMs=$totalTimeMs, goalType=$goalType, motivations=${motivations.join(', ')}', name: 'Analytics');
    }
  }

  @override
  Future<void> trackAppOpened(bool isFirstTime) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] app_opened: isFirstTime=$isFirstTime', name: 'Analytics');
    }
  }

  @override
  Future<void> trackSessionStarted() async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] session_started', name: 'Analytics');
    }
  }

  @override
  Future<void> trackSessionEnded(int durationMs) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] session_ended: durationMs=$durationMs', name: 'Analytics');
    }
  }

  @override
  Future<void> trackScanInitiated(String source) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] scan_initiated: source=$source', name: 'Analytics');
    }
  }

  @override
  Future<void> trackScanSuccessful(String barcode, bool productFound, int scanDurationMs) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] scan_successful: barcode=$barcode, productFound=$productFound, scanDurationMs=$scanDurationMs', name: 'Analytics');
    }
  }

  @override
  Future<void> trackScanFailed(String errorType, int retryCount) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] scan_failed: errorType=$errorType, retryCount=$retryCount', name: 'Analytics');
    }
  }

  @override
  Future<void> trackManualSearchUsed(String searchTerm, bool resultsFound) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] manual_search_used: searchTerm=$searchTerm, resultsFound=$resultsFound', name: 'Analytics');
    }
  }

  @override
  Future<void> trackProductViewed(String barcode, String productName, double sugarPer100g, String category) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] product_viewed: barcode=$barcode, productName=$productName, sugarPer100g=$sugarPer100g, category=$category', name: 'Analytics');
    }
  }

  @override
  Future<void> trackProductAnalysisCompleted(int hiddenSugarsCount, int sweetenersCount, int additivesCount) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] product_analysis_completed: hiddenSugarsCount=$hiddenSugarsCount, sweetenersCount=$sweetenersCount, additivesCount=$additivesCount', name: 'Analytics');
    }
  }

  @override
  Future<void> trackSugarLevelChecked(double sugarPer100g, String levelCategory) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] sugar_level_checked: sugarPer100g=$sugarPer100g, levelCategory=$levelCategory', name: 'Analytics');
    }
  }

  @override
  Future<void> trackProductAddedToLog(String productName, double sugarContent, double servingSize) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] product_added_to_log: productName=$productName, sugarContent=$sugarContent, servingSize=$servingSize', name: 'Analytics');
    }
  }

  @override
  Future<void> trackDailyLogViewed(int totalEntries, double totalSugar, double goalProgress) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] daily_log_viewed: totalEntries=$totalEntries, totalSugar=$totalSugar, goalProgress=$goalProgress', name: 'Analytics');
    }
  }

  @override
  Future<void> trackLogEntryRemoved(String productName, double sugarContent) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] log_entry_removed: productName=$productName, sugarContent=$sugarContent', name: 'Analytics');
    }
  }

  @override
  Future<void> trackDailyGoalAchieved(String goalType, double actualSugar, double goalSugar) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] daily_goal_achieved: goalType=$goalType, actualSugar=$actualSugar, goalSugar=$goalSugar', name: 'Analytics');
    }
  }

  @override
  Future<void> trackDailyGoalExceeded(String goalType, double excessAmount) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] daily_goal_exceeded: goalType=$goalType, excessAmount=$excessAmount', name: 'Analytics');
    }
  }

  @override
  Future<void> trackScreenViewed(String screenName, int timeSpentMs, String? previousScreen) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] screen_viewed: screenName=$screenName, timeSpentMs=$timeSpentMs, previousScreen=$previousScreen', name: 'Analytics');
    }
  }

  @override
  Future<void> trackFeatureUsed(String featureName) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] feature_used: featureName=$featureName', name: 'Analytics');
    }
  }

  @override
  Future<void> trackTabSwitched(String fromTab, String toTab, int timeOnPreviousTab) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] tab_switched: fromTab=$fromTab, toTab=$toTab, timeOnPreviousTab=$timeOnPreviousTab', name: 'Analytics');
    }
  }

  @override
  Future<void> trackRecommendationsViewed(String productCategory, int recommendationsCount) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] recommendations_viewed: productCategory=$productCategory, recommendationsCount=$recommendationsCount', name: 'Analytics');
    }
  }

  @override
  Future<void> trackRecommendationClicked(String recommendationProduct, int position) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] recommendation_clicked: recommendationProduct=$recommendationProduct, position=$position', name: 'Analytics');
    }
  }

  @override
  Future<void> trackAlternativeSelected(String originalProduct, String alternativeProduct) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] alternative_selected: originalProduct=$originalProduct, alternativeProduct=$alternativeProduct', name: 'Analytics');
    }
  }

  @override
  Future<void> trackApiError(String errorType, String barcode, int retryCount) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] api_error: errorType=$errorType, barcode=$barcode, retryCount=$retryCount', name: 'Analytics');
    }
  }

  @override
  Future<void> trackScanError(String errorType, bool cameraPermission, int retryCount) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] scan_error: errorType=$errorType, cameraPermission=$cameraPermission, retryCount=$retryCount', name: 'Analytics');
    }
  }

  @override
  Future<void> trackProductNotFound(String barcode, int searchAttempts) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] product_not_found: barcode=$barcode, searchAttempts=$searchAttempts', name: 'Analytics');
    }
  }

  @override
  Future<void> setUserProperty(String key, dynamic value) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] set_user_property: key=$key, value=$value', name: 'Analytics');
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    if (kDebugMode) {
      log('📊 [ANALYTICS] set_user_id: userId=$userId', name: 'Analytics');
    }
  }
}
