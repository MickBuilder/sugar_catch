/// Type-safe event definitions for analytics
/// This provides a centralized place for all event names and properties
class AnalyticsEvents {
  // Onboarding Events
  static const String onboardingScreenViewed = 'onboarding_screen_viewed';
  static const String onboardingScreenCompleted = 'onboarding_screen_completed';
  static const String onboardingGoalSelected = 'onboarding_goal_selected';
  static const String onboardingMotivationSelected = 'onboarding_motivation_selected';
  static const String onboardingCompleted = 'onboarding_completed';

  // App Lifecycle Events
  static const String appOpened = 'app_opened';
  static const String sessionStarted = 'session_started';
  static const String sessionEnded = 'session_ended';

  // Scanning Events
  static const String scanInitiated = 'scan_initiated';
  static const String scanSuccessful = 'scan_successful';
  static const String scanFailed = 'scan_failed';
  static const String manualSearchUsed = 'manual_search_used';

  // Product Analysis Events
  static const String productViewed = 'product_viewed';
  static const String productAnalysisCompleted = 'product_analysis_completed';
  static const String sugarLevelChecked = 'sugar_level_checked';

  // Daily Tracking Events
  static const String productAddedToLog = 'product_added_to_log';
  static const String dailyLogViewed = 'daily_log_viewed';
  static const String logEntryRemoved = 'log_entry_removed';
  static const String dailyGoalAchieved = 'daily_goal_achieved';
  static const String dailyGoalExceeded = 'daily_goal_exceeded';

  // Navigation Events
  static const String screenViewed = 'screen_viewed';
  static const String featureUsed = 'feature_used';
  static const String tabSwitched = 'tab_switched';

  // Recommendations Events
  static const String recommendationsViewed = 'recommendations_viewed';
  static const String recommendationClicked = 'recommendation_clicked';
  static const String alternativeSelected = 'alternative_selected';

  // Error Events
  static const String apiError = 'api_error';
  static const String scanError = 'scan_error';
  static const String productNotFound = 'product_not_found';
}

/// Event property keys for consistent naming
class AnalyticsProperties {
  // Common properties
  static const String screenIndex = 'screen_index';
  static const String screenName = 'screen_name';
  static const String timeSpentMs = 'time_spent_ms';
  static const String totalTimeMs = 'total_time_ms';
  static const String isFirstTime = 'is_first_time';
  static const String durationMs = 'duration_ms';
  static const String source = 'source';
  static const String barcode = 'barcode';
  static const String productName = 'product_name';
  static const String productFound = 'product_found';
  static const String scanDurationMs = 'scan_duration_ms';
  static const String errorType = 'error_type';
  static const String retryCount = 'retry_count';
  static const String searchTerm = 'search_term';
  static const String resultsFound = 'results_found';
  static const String sugarPer100g = 'sugar_per_100g';
  static const String category = 'category';
  static const String hiddenSugarsCount = 'hidden_sugars_count';
  static const String sweetenersCount = 'sweeteners_count';
  static const String additivesCount = 'additives_count';
  static const String levelCategory = 'level_category';
  static const String sugarContent = 'sugar_content';
  static const String servingSize = 'serving_size';
  static const String totalEntries = 'total_entries';
  static const String totalSugar = 'total_sugar';
  static const String goalProgress = 'goal_progress';
  static const String goalType = 'goal_type';
  static const String actualSugar = 'actual_sugar';
  static const String goalSugar = 'goal_sugar';
  static const String excessAmount = 'excess_amount';
  static const String previousScreen = 'previous_screen';
  static const String featureName = 'feature_name';
  static const String fromTab = 'from_tab';
  static const String toTab = 'to_tab';
  static const String timeOnPreviousTab = 'time_on_previous_tab';
  static const String productCategory = 'product_category';
  static const String recommendationsCount = 'recommendations_count';
  static const String recommendationProduct = 'recommendation_product';
  static const String position = 'position';
  static const String originalProduct = 'original_product';
  static const String alternativeProduct = 'alternative_product';
  static const String searchAttempts = 'search_attempts';
  static const String cameraPermission = 'camera_permission';
  static const String motivations = 'motivations';
  static const String motivationCount = 'motivation_count';
}

/// Sugar level categories for consistent tracking
class SugarLevelCategories {
  static const String low = 'low';
  static const String moderate = 'moderate';
  static const String high = 'high';
  static const String veryHigh = 'very_high';
}

/// Scan sources for consistent tracking
class ScanSources {
  static const String camera = 'camera';
  static const String manualSearch = 'manual_search';
}

/// Feature names for consistent tracking
class FeatureNames {
  static const String scan = 'scan';
  static const String track = 'track';
  static const String history = 'history';
  static const String progress = 'progress';
  static const String recommendations = 'recommendations';
  static const String onboarding = 'onboarding';
}

/// Screen names for consistent tracking
class ScreenNames {
  static const String onboarding = 'onboarding';
  static const String home = 'home';
  static const String scan = 'scan';
  static const String product = 'product';
  static const String track = 'track';
  static const String history = 'history';
  static const String progress = 'progress';
}
