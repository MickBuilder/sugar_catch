import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:cleanfood/core/config/env.dart';
import 'analytics_client.dart';
import 'logger_analytics_client.dart';
import 'mixpanel_analytics_client.dart';

/// Main analytics facade that routes events to multiple clients
/// This allows us to send events to both Mixpanel and debug logger
class AnalyticsFacade implements AnalyticsClient {
  const AnalyticsFacade(this._clients);
  final List<AnalyticsClient> _clients;

  @override
  Future<void> trackOnboardingScreenViewed(int screenIndex, String screenName) async {
    for (final client in _clients) {
      await client.trackOnboardingScreenViewed(screenIndex, screenName);
    }
  }

  @override
  Future<void> trackOnboardingScreenCompleted(int screenIndex, int timeSpentMs) async {
    for (final client in _clients) {
      await client.trackOnboardingScreenCompleted(screenIndex, timeSpentMs);
    }
  }

  @override
  Future<void> trackOnboardingGoalSelected(String goalType) async {
    for (final client in _clients) {
      await client.trackOnboardingGoalSelected(goalType);
    }
  }

  @override
  Future<void> trackOnboardingMotivationSelected(List<String> motivations) async {
    for (final client in _clients) {
      await client.trackOnboardingMotivationSelected(motivations);
    }
  }

  @override
  Future<void> trackOnboardingCompleted(int totalTimeMs, String goalType, List<String> motivations) async {
    for (final client in _clients) {
      await client.trackOnboardingCompleted(totalTimeMs, goalType, motivations);
    }
  }

  @override
  Future<void> trackAppOpened(bool isFirstTime) async {
    for (final client in _clients) {
      await client.trackAppOpened(isFirstTime);
    }
  }

  @override
  Future<void> trackSessionStarted() async {
    for (final client in _clients) {
      await client.trackSessionStarted();
    }
  }

  @override
  Future<void> trackSessionEnded(int durationMs) async {
    for (final client in _clients) {
      await client.trackSessionEnded(durationMs);
    }
  }

  @override
  Future<void> trackScanInitiated(String source) async {
    for (final client in _clients) {
      await client.trackScanInitiated(source);
    }
  }

  @override
  Future<void> trackScanSuccessful(String barcode, bool productFound, int scanDurationMs) async {
    for (final client in _clients) {
      await client.trackScanSuccessful(barcode, productFound, scanDurationMs);
    }
  }

  @override
  Future<void> trackScanFailed(String errorType, int retryCount) async {
    for (final client in _clients) {
      await client.trackScanFailed(errorType, retryCount);
    }
  }

  @override
  Future<void> trackManualSearchUsed(String searchTerm, bool resultsFound) async {
    for (final client in _clients) {
      await client.trackManualSearchUsed(searchTerm, resultsFound);
    }
  }

  @override
  Future<void> trackProductViewed(String barcode, String productName, double sugarPer100g, String category) async {
    for (final client in _clients) {
      await client.trackProductViewed(barcode, productName, sugarPer100g, category);
    }
  }

  @override
  Future<void> trackProductAnalysisCompleted(int hiddenSugarsCount, int sweetenersCount, int additivesCount) async {
    for (final client in _clients) {
      await client.trackProductAnalysisCompleted(hiddenSugarsCount, sweetenersCount, additivesCount);
    }
  }

  @override
  Future<void> trackSugarLevelChecked(double sugarPer100g, String levelCategory) async {
    for (final client in _clients) {
      await client.trackSugarLevelChecked(sugarPer100g, levelCategory);
    }
  }

  @override
  Future<void> trackProductAddedToLog(String productName, double sugarContent, double servingSize) async {
    for (final client in _clients) {
      await client.trackProductAddedToLog(productName, sugarContent, servingSize);
    }
  }

  @override
  Future<void> trackDailyLogViewed(int totalEntries, double totalSugar, double goalProgress) async {
    for (final client in _clients) {
      await client.trackDailyLogViewed(totalEntries, totalSugar, goalProgress);
    }
  }

  @override
  Future<void> trackLogEntryRemoved(String productName, double sugarContent) async {
    for (final client in _clients) {
      await client.trackLogEntryRemoved(productName, sugarContent);
    }
  }

  @override
  Future<void> trackDailyGoalAchieved(String goalType, double actualSugar, double goalSugar) async {
    for (final client in _clients) {
      await client.trackDailyGoalAchieved(goalType, actualSugar, goalSugar);
    }
  }

  @override
  Future<void> trackDailyGoalExceeded(String goalType, double excessAmount) async {
    for (final client in _clients) {
      await client.trackDailyGoalExceeded(goalType, excessAmount);
    }
  }

  @override
  Future<void> trackScreenViewed(String screenName, int timeSpentMs, String? previousScreen) async {
    for (final client in _clients) {
      await client.trackScreenViewed(screenName, timeSpentMs, previousScreen);
    }
  }

  @override
  Future<void> trackFeatureUsed(String featureName) async {
    for (final client in _clients) {
      await client.trackFeatureUsed(featureName);
    }
  }

  @override
  Future<void> trackTabSwitched(String fromTab, String toTab, int timeOnPreviousTab) async {
    for (final client in _clients) {
      await client.trackTabSwitched(fromTab, toTab, timeOnPreviousTab);
    }
  }

  @override
  Future<void> trackRecommendationsViewed(String productCategory, int recommendationsCount) async {
    for (final client in _clients) {
      await client.trackRecommendationsViewed(productCategory, recommendationsCount);
    }
  }

  @override
  Future<void> trackRecommendationClicked(String recommendationProduct, int position) async {
    for (final client in _clients) {
      await client.trackRecommendationClicked(recommendationProduct, position);
    }
  }

  @override
  Future<void> trackAlternativeSelected(String originalProduct, String alternativeProduct) async {
    for (final client in _clients) {
      await client.trackAlternativeSelected(originalProduct, alternativeProduct);
    }
  }

  @override
  Future<void> trackApiError(String errorType, String barcode, int retryCount) async {
    for (final client in _clients) {
      await client.trackApiError(errorType, barcode, retryCount);
    }
  }

  @override
  Future<void> trackScanError(String errorType, bool cameraPermission, int retryCount) async {
    for (final client in _clients) {
      await client.trackScanError(errorType, cameraPermission, retryCount);
    }
  }

  @override
  Future<void> trackProductNotFound(String barcode, int searchAttempts) async {
    for (final client in _clients) {
      await client.trackProductNotFound(barcode, searchAttempts);
    }
  }

  @override
  Future<void> setUserProperty(String key, dynamic value) async {
    for (final client in _clients) {
      await client.setUserProperty(key, value);
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    for (final client in _clients) {
      await client.setUserId(userId);
    }
  }
}

/// Provider for Mixpanel client
final mixpanelAnalyticsClientProvider = FutureProvider<MixpanelAnalyticsClient>((ref) async {
  // Initialize Mixpanel with project token from Envied (secure)
  final token = Env.mixpanelProjectToken;
  log('📊 [ANALYTICS] Initializing Mixpanel with token: ${token.substring(0, 8)}...', name: 'Analytics');
  final mixpanel = await Mixpanel.init(token, trackAutomaticEvents: true);
  log('✅ [ANALYTICS] Mixpanel initialized successfully', name: 'Analytics');
  return MixpanelAnalyticsClient(mixpanel);
});

/// Provider for analytics facade
final analyticsFacadeProvider = FutureProvider<AnalyticsFacade>((ref) async {
  try {
    final mixpanelClient = await ref.watch(mixpanelAnalyticsClientProvider.future);
    
    log('📊 [ANALYTICS] Creating analytics facade with ${kDebugMode ? '2' : '1'} clients', name: 'Analytics');
    
    return AnalyticsFacade([
      mixpanelClient,
      if (kDebugMode) const LoggerAnalyticsClient(),
    ]);
  } catch (e) {
    log('⚠️ [ANALYTICS] Failed to create analytics facade: $e', name: 'Analytics');
    // Return a facade with just the logger client as fallback
    return AnalyticsFacade([
      if (kDebugMode) const LoggerAnalyticsClient(),
    ]);
  }
});
