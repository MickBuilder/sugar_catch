import 'dart:developer';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatService {
  static const String _projectKey = 'appl_jCSpxavIhZwlsIuFMpqilajUdfq';
  static const String _entitlementId = 'premium';
  
  static bool _isInitialized = false;
  static CustomerInfo? _customerInfo;
  
  /// Initialize RevenueCat with project key
  static Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      log('📱 [RevenueCat] Initializing with project key: ${_projectKey.substring(0, 8)}...', name: 'RevenueCat');
      
      await Purchases.setLogLevel(LogLevel.debug);
      await Purchases.configure(PurchasesConfiguration(_projectKey));
      
      // Get initial customer info
      _customerInfo = await Purchases.getCustomerInfo();
      
      _isInitialized = true;
      log('✅ [RevenueCat] Successfully initialized', name: 'RevenueCat');
      
      // Listen for customer info updates
      Purchases.addCustomerInfoUpdateListener(_onCustomerInfoUpdated);
      
    } catch (e) {
      log('❌ [RevenueCat] Initialization failed: $e', name: 'RevenueCat');
      rethrow;
    }
  }
  
  /// Check if user has active subscription
  static bool get hasActiveSubscription {
    if (_customerInfo == null) return false;
    return _customerInfo!.entitlements.active.containsKey(_entitlementId);
  }
  
  /// Check if user is in trial period
  static bool get isInTrial {
    if (_customerInfo == null) return false;
    
    final entitlement = _customerInfo!.entitlements.active[_entitlementId];
    if (entitlement == null) return false;
    
    return entitlement.periodType == PeriodType.trial;
  }
  
  /// Check if user has access (subscription or trial)
  static bool get hasAccess {
    return hasActiveSubscription || isInTrial;
  }
  
  /// Get trial remaining days
  static int? get trialRemainingDays {
    if (!isInTrial) return null;
    
    final entitlement = _customerInfo!.entitlements.active[_entitlementId];
    if (entitlement?.expirationDate == null) return null;
    
    final now = DateTime.now();
    final expiration = DateTime.parse(entitlement!.expirationDate!);
    final difference = expiration.difference(now).inDays;
    
    return difference > 0 ? difference : 0;
  }
  
  /// Get current offering
  static Future<Offering?> getCurrentOffering() async {
    try {
      final offerings = await Purchases.getOfferings();
      return offerings.current;
    } catch (e) {
      log('❌ [RevenueCat] Failed to get offering: $e', name: 'RevenueCat');
      return null;
    }
  }
  
  /// Purchase a package
  static Future<bool> purchasePackage(Package package) async {
    try {
      log('💳 [RevenueCat] Starting purchase for package: ${package.identifier}', name: 'RevenueCat');
      
      final purchaseResult = await Purchases.purchase(PurchaseParams.package(package));
      _customerInfo = purchaseResult.customerInfo;
      
      final success = purchaseResult.customerInfo.entitlements.active.containsKey(_entitlementId);
      
      if (success) {
        log('✅ [RevenueCat] Purchase successful', name: 'RevenueCat');
      } else {
        log('❌ [RevenueCat] Purchase failed - no active entitlement', name: 'RevenueCat');
      }
      
      return success;
    } catch (e) {
      log('❌ [RevenueCat] Purchase failed: $e', name: 'RevenueCat');
      return false;
    }
  }
  
  /// Restore purchases
  static Future<bool> restorePurchases() async {
    try {
      log('🔄 [RevenueCat] Restoring purchases...', name: 'RevenueCat');
      
      final customerInfo = await Purchases.restorePurchases();
      _customerInfo = customerInfo;
      
      final success = customerInfo.entitlements.active.containsKey(_entitlementId);
      
      if (success) {
        log('✅ [RevenueCat] Purchases restored successfully', name: 'RevenueCat');
      } else {
        log('❌ [RevenueCat] No active purchases found', name: 'RevenueCat');
      }
      
      return success;
    } catch (e) {
      log('❌ [RevenueCat] Restore failed: $e', name: 'RevenueCat');
      return false;
    }
  }
  
  /// Get customer info
  static Future<CustomerInfo> getCustomerInfo() async {
    try {
      _customerInfo = await Purchases.getCustomerInfo();
      return _customerInfo!;
    } catch (e) {
      log('❌ [RevenueCat] Failed to get customer info: $e', name: 'RevenueCat');
      rethrow;
    }
  }
  
  /// Handle customer info updates
  static void _onCustomerInfoUpdated(CustomerInfo customerInfo) {
    log('🔄 [RevenueCat] Customer info updated', name: 'RevenueCat');
    _customerInfo = customerInfo;
  }
  
  /// Check if trial has expired
  static bool get isTrialExpired {
    if (!isInTrial) return false;
    
    final entitlement = _customerInfo!.entitlements.active[_entitlementId];
    if (entitlement?.expirationDate == null) return false;
    
    return DateTime.now().isAfter(DateTime.parse(entitlement!.expirationDate!));
  }
  
  /// Get subscription status summary
  static Map<String, dynamic> getSubscriptionStatus() {
    return {
      'hasActiveSubscription': hasActiveSubscription,
      'isInTrial': isInTrial,
      'hasAccess': hasAccess,
      'trialRemainingDays': trialRemainingDays,
      'isTrialExpired': isTrialExpired,
      'entitlementId': _entitlementId,
    };
  }
}
