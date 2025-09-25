import 'dart:developer';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'analytics_client.dart';

/// Mixpanel implementation of analytics client
/// Sends events to Mixpanel in production mode
class MixpanelAnalyticsClient implements AnalyticsClient {
  const MixpanelAnalyticsClient(this._mixpanel);
  final Mixpanel _mixpanel;

  @override
  Future<void> trackOnboardingScreenViewed(int screenIndex, String screenName) async {
    // Send to Mixpanel in both debug and release modes for testing
    log('📊 [MIXPANEL] Sending onboarding_screen_viewed event to Mixpanel', name: 'Mixpanel');
    await _mixpanel.track('onboarding_screen_viewed', properties: {
      'screen_index': screenIndex,
      'screen_name': screenName,
    });
    log('📊 [MIXPANEL] onboarding_screen_viewed event sent successfully', name: 'Mixpanel');
  }

  @override
  Future<void> trackOnboardingScreenCompleted(int screenIndex, int timeSpentMs) async {
    // Send to Mixpanel in both debug and release modes for testing
    await _mixpanel.track('onboarding_screen_completed', properties: {
      'screen_index': screenIndex,
      'time_spent_ms': timeSpentMs,
    });
  }

  @override
  Future<void> trackOnboardingGoalSelected(String goalType) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('onboarding_goal_selected', properties: {
        'goal_type': goalType,
      });
    }
  }

  @override
  Future<void> trackOnboardingMotivationSelected(List<String> motivations) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('onboarding_motivation_selected', properties: {
        'motivations': motivations,
        'motivation_count': motivations.length,
      });
    }
  }

  @override
  Future<void> trackOnboardingCompleted(int totalTimeMs, String goalType, List<String> motivations) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('onboarding_completed', properties: {
        'total_time_ms': totalTimeMs,
        'goal_type': goalType,
        'motivations': motivations,
        'motivation_count': motivations.length,
      });
    }
  }

  @override
  Future<void> trackAppOpened(bool isFirstTime) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('app_opened', properties: {
        'is_first_time': isFirstTime,
      });
    }
  }

  @override
  Future<void> trackSessionStarted() async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('session_started');
    }
  }

  @override
  Future<void> trackSessionEnded(int durationMs) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('session_ended', properties: {
        'duration_ms': durationMs,
      });
    }
  }

  @override
  Future<void> trackScanInitiated(String source) async {
    // Send to Mixpanel in both debug and release modes for testing
    log('📊 [MIXPANEL] Sending scan_initiated event to Mixpanel', name: 'Mixpanel');
    await _mixpanel.track('scan_initiated', properties: {
      'source': source,
    });
    log('📊 [MIXPANEL] scan_initiated event sent successfully', name: 'Mixpanel');
  }

  @override
  Future<void> trackScanSuccessful(String barcode, bool productFound, int scanDurationMs) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('scan_successful', properties: {
        'barcode': barcode,
        'product_found': productFound,
        'scan_duration_ms': scanDurationMs,
      });
    }
  }

  @override
  Future<void> trackScanFailed(String errorType, int retryCount) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('scan_failed', properties: {
        'error_type': errorType,
        'retry_count': retryCount,
      });
    }
  }

  @override
  Future<void> trackManualSearchUsed(String searchTerm, bool resultsFound) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('manual_search_used', properties: {
        'search_term': searchTerm,
        'results_found': resultsFound,
      });
    }
  }

  @override
  Future<void> trackProductViewed(String barcode, String productName, double sugarPer100g, String category) async {
    // Send to Mixpanel in both debug and release modes for testing
    log('📊 [MIXPANEL] Sending product_viewed event to Mixpanel', name: 'Mixpanel');
    await _mixpanel.track('product_viewed', properties: {
      'barcode': barcode,
      'product_name': productName,
      'sugar_per_100g': sugarPer100g,
      'category': category,
    });
    log('📊 [MIXPANEL] product_viewed event sent successfully', name: 'Mixpanel');
  }

  @override
  Future<void> trackProductAnalysisCompleted(int hiddenSugarsCount, int sweetenersCount, int additivesCount) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('product_analysis_completed', properties: {
        'hidden_sugars_count': hiddenSugarsCount,
        'sweeteners_count': sweetenersCount,
        'additives_count': additivesCount,
      });
    }
  }

  @override
  Future<void> trackSugarLevelChecked(double sugarPer100g, String levelCategory) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('sugar_level_checked', properties: {
        'sugar_per_100g': sugarPer100g,
        'level_category': levelCategory,
      });
    }
  }

  @override
  Future<void> trackProductAddedToLog(String productName, double sugarContent, double servingSize) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('product_added_to_log', properties: {
        'product_name': productName,
        'sugar_content': sugarContent,
        'serving_size': servingSize,
      });
    }
  }

  @override
  Future<void> trackDailyLogViewed(int totalEntries, double totalSugar, double goalProgress) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('daily_log_viewed', properties: {
        'total_entries': totalEntries,
        'total_sugar': totalSugar,
        'goal_progress': goalProgress,
      });
    }
  }

  @override
  Future<void> trackLogEntryRemoved(String productName, double sugarContent) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('log_entry_removed', properties: {
        'product_name': productName,
        'sugar_content': sugarContent,
      });
    }
  }

  @override
  Future<void> trackDailyGoalAchieved(String goalType, double actualSugar, double goalSugar) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('daily_goal_achieved', properties: {
        'goal_type': goalType,
        'actual_sugar': actualSugar,
        'goal_sugar': goalSugar,
      });
    }
  }

  @override
  Future<void> trackDailyGoalExceeded(String goalType, double excessAmount) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('daily_goal_exceeded', properties: {
        'goal_type': goalType,
        'excess_amount': excessAmount,
      });
    }
  }

  @override
  Future<void> trackScreenViewed(String screenName, int timeSpentMs, String? previousScreen) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('screen_viewed', properties: {
        'screen_name': screenName,
        'time_spent_ms': timeSpentMs,
        'previous_screen': previousScreen,
      });
    }
  }

  @override
  Future<void> trackFeatureUsed(String featureName) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('feature_used', properties: {
        'feature_name': featureName,
      });
    }
  }

  @override
  Future<void> trackTabSwitched(String fromTab, String toTab, int timeOnPreviousTab) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('tab_switched', properties: {
        'from_tab': fromTab,
        'to_tab': toTab,
        'time_on_previous_tab': timeOnPreviousTab,
      });
    }
  }

  @override
  Future<void> trackRecommendationsViewed(String productCategory, int recommendationsCount) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('recommendations_viewed', properties: {
        'product_category': productCategory,
        'recommendations_count': recommendationsCount,
      });
    }
  }

  @override
  Future<void> trackRecommendationClicked(String recommendationProduct, int position) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('recommendation_clicked', properties: {
        'recommendation_product': recommendationProduct,
        'position': position,
      });
    }
  }

  @override
  Future<void> trackAlternativeSelected(String originalProduct, String alternativeProduct) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('alternative_selected', properties: {
        'original_product': originalProduct,
        'alternative_product': alternativeProduct,
      });
    }
  }

  @override
  Future<void> trackApiError(String errorType, String barcode, int retryCount) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('api_error', properties: {
        'error_type': errorType,
        'barcode': barcode,
        'retry_count': retryCount,
      });
    }
  }

  @override
  Future<void> trackScanError(String errorType, bool cameraPermission, int retryCount) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('scan_error', properties: {
        'error_type': errorType,
        'camera_permission': cameraPermission,
        'retry_count': retryCount,
      });
    }
  }

  @override
  Future<void> trackProductNotFound(String barcode, int searchAttempts) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.track('product_not_found', properties: {
        'barcode': barcode,
        'search_attempts': searchAttempts,
      });
    }
  }

  @override
  Future<void> setUserProperty(String key, dynamic value) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      _mixpanel.getPeople().set(key, value);
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    // Send to Mixpanel in both debug and release modes for testing
    {
      await _mixpanel.identify(userId);
    }
  }
}
