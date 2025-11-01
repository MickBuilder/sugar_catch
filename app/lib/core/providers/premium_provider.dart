import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/core/services/revenuecat_service.dart';

/// Premium state management
class PremiumState {
  final bool hasActiveSubscription;
  final bool isInTrial;
  final bool hasAccess;
  final int? trialRemainingDays;
  final bool isTrialExpired;
  final bool isLoading;
  final String? error;

  const PremiumState({
    this.hasActiveSubscription = false,
    this.isInTrial = false,
    this.hasAccess = false,
    this.trialRemainingDays,
    this.isTrialExpired = false,
    this.isLoading = false,
    this.error,
  });

  PremiumState copyWith({
    bool? hasActiveSubscription,
    bool? isInTrial,
    bool? hasAccess,
    int? trialRemainingDays,
    bool? isTrialExpired,
    bool? isLoading,
    String? error,
  }) {
    return PremiumState(
      hasActiveSubscription: hasActiveSubscription ?? this.hasActiveSubscription,
      isInTrial: isInTrial ?? this.isInTrial,
      hasAccess: hasAccess ?? this.hasAccess,
      trialRemainingDays: trialRemainingDays ?? this.trialRemainingDays,
      isTrialExpired: isTrialExpired ?? this.isTrialExpired,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// Premium state notifier
class PremiumNotifier extends StateNotifier<PremiumState> {
  PremiumNotifier() : super(const PremiumState());

  /// Initialize premium status
  Future<void> initialize() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      log('📱 [Premium] Initializing premium status...', name: 'Premium');
      
      // Initialize RevenueCat
      await RevenueCatService.initialize();
      
      // Get current status
      await _updateStatus();
      
      log('✅ [Premium] Premium status initialized', name: 'Premium');
    } catch (e) {
      log('❌ [Premium] Initialization failed: $e', name: 'Premium');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Update premium status
  Future<void> _updateStatus() async {
    try {
      final status = RevenueCatService.getSubscriptionStatus();
      
      state = state.copyWith(
        hasActiveSubscription: status['hasActiveSubscription'] as bool,
        isInTrial: status['isInTrial'] as bool,
        hasAccess: status['hasAccess'] as bool,
        trialRemainingDays: status['trialRemainingDays'] as int?,
        isTrialExpired: status['isTrialExpired'] as bool,
        isLoading: false,
        error: null,
      );
      
      log('📊 [Premium] Status updated: $status', name: 'Premium');
    } catch (e) {
      log('❌ [Premium] Failed to update status: $e', name: 'Premium');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Refresh premium status
  Future<void> refresh() async {
    await _updateStatus();
  }

  /// Purchase a package
  Future<bool> purchasePackage(dynamic package) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      log('💳 [Premium] Starting purchase...', name: 'Premium');
      
      final success = await RevenueCatService.purchasePackage(package);
      
      if (success) {
        await _updateStatus();
        log('✅ [Premium] Purchase successful', name: 'Premium');
      } else {
        log('❌ [Premium] Purchase failed', name: 'Premium');
      }
      
      return success;
    } catch (e) {
      log('❌ [Premium] Purchase error: $e', name: 'Premium');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Restore purchases
  Future<bool> restorePurchases() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      log('🔄 [Premium] Restoring purchases...', name: 'Premium');
      
      final success = await RevenueCatService.restorePurchases();
      
      if (success) {
        await _updateStatus();
        log('✅ [Premium] Purchases restored', name: 'Premium');
      } else {
        log('❌ [Premium] No purchases to restore', name: 'Premium');
      }
      
      return success;
    } catch (e) {
      log('❌ [Premium] Restore error: $e', name: 'Premium');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Check if user should see paywall
  bool get shouldShowPaywall {
    // Show paywall if no access
    return !state.hasAccess;
  }

  /// Check if user can access app
  bool get canAccessApp {
    return state.hasAccess;
  }
}

/// Premium provider
final premiumProvider = StateNotifierProvider<PremiumNotifier, PremiumState>((ref) {
  return PremiumNotifier();
});

/// Premium access provider (computed)
final premiumAccessProvider = Provider<bool>((ref) {
  final premiumState = ref.watch(premiumProvider);
  return premiumState.hasAccess;
});

/// Should show paywall provider (computed)
final shouldShowPaywallProvider = Provider<bool>((ref) {
  final premiumNotifier = ref.watch(premiumProvider.notifier);
  return premiumNotifier.shouldShowPaywall;
});
