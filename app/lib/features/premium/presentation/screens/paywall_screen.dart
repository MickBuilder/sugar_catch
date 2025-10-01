import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sweetr/core/providers/premium_provider.dart';
import 'package:sweetr/core/services/revenuecat_service.dart';
import 'package:url_launcher/url_launcher.dart';

// Helper function to show paywall as bottom sheet
Future<void> showPaywallBottomSheet(BuildContext context) {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (context) => const PaywallScreen(),
  );
}

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  Package? _selectedPackage;
  List<Package> _availablePackages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadOffering();
  }

  Future<void> _loadOffering() async {
    try {
      final offering = await RevenueCatService.getCurrentOffering();
      if (offering != null && offering.availablePackages.isNotEmpty) {
        setState(() {
          _availablePackages = offering.availablePackages;
          _selectedPackage = offering.availablePackages.first;
        });
      }
    } catch (e) {
      log('❌ [Paywall] Failed to load offering: $e', name: 'Paywall');
    }
  }

  Future<void> _startTrial() async {
    if (_selectedPackage == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      HapticFeedback.lightImpact();
      
      final success = await ref.read(premiumProvider.notifier).purchasePackage(_selectedPackage!);
      
      if (success) {
        HapticFeedback.heavyImpact();
        log('✅ [Paywall] Trial started successfully', name: 'Paywall');
        // Navigation will be handled by the router based on premium status
      } else {
        HapticFeedback.heavyImpact();
        _showErrorDialog('Failed to start trial. Please try again.');
      }
    } catch (e) {
      log('❌ [Paywall] Trial start error: $e', name: 'Paywall');
      _showErrorDialog('An error occurred. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _restorePurchases() async {
    setState(() {
      _isLoading = true;
    });

    try {
      HapticFeedback.lightImpact();
      
      final success = await ref.read(premiumProvider.notifier).restorePurchases();
      
      if (success) {
        HapticFeedback.heavyImpact();
        log('✅ [Paywall] Purchases restored successfully', name: 'Paywall');
      } else {
        HapticFeedback.heavyImpact();
        _showErrorDialog('No purchases found to restore.');
      }
    } catch (e) {
      log('❌ [Paywall] Restore error: $e', name: 'Paywall');
      _showErrorDialog('Failed to restore purchases. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _openPrivacyPolicy() async {
    const url = 'https://pacific-professor-cc7.notion.site/Sweetr-Terms-of-Use-Privacy-Policy-27fdd39132a280d69bcfd8116e4a4c7d';
    final uri = Uri.parse(url);
    
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        log('❌ [Paywall] Could not launch privacy policy URL: $url', name: 'Paywall');
        _showErrorDialog('Could not open privacy policy. Please try again.');
      }
    } catch (e) {
      log('❌ [Paywall] Error opening privacy policy: $e', name: 'Paywall');
      _showErrorDialog('Could not open privacy policy. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: CupertinoColors.systemGroupedBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Close button
            _buildCloseButton(),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Header with app icon and title
                    _buildHeader(),
                    const SizedBox(height: 32),
                    
                    // Features list
                    _buildFeaturesList(),
                    
                    const SizedBox(height: 40), // Bottom padding instead of Spacer
                  ],
                ),
              ),
            ),
            
            // Fixed pricing section at bottom
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Pricing options
                  _buildPricingOptions(),
                  const SizedBox(height: 12),
                  
                  // Disclaimer text
                  _buildDisclaimerText(),
                  const SizedBox(height: 12),
                  
                  // CTA button
                  _buildCTAButton(),
                  const SizedBox(height: 12),
                  
                  // Footer links
                  _buildFooterLinks(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoButton(
            onPressed: () {
              // Dismiss the bottom sheet
              Navigator.of(context).pop();
            },
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                CupertinoIcons.xmark,
                size: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // App icon
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/icon.png',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        // Title
        const Text(
          'Get Sweetr Premium',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeaturesList() {
    final features = [
      {'icon': '🔍', 'title': 'Uncover hidden sugars', 'description': 'Reveal the shocking truth about sugar in "healthy" products'},
      {'icon': '📈', 'title': 'Achieve your sugar detox faster', 'description': 'Track progress and stay motivated with detailed insights'},
      {'icon': '💡', 'title': 'Make smarter food choices', 'description': 'Get instant recommendations for healthier alternatives'},
    ];

    return Column(
      children: features.map((feature) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              // Feature icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    feature['icon']!,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              
              // Feature text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feature['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      feature['description']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPricingOptions() {
    if (_availablePackages.isEmpty) {
      return const CupertinoActivityIndicator();
    }

      return Column(
        children: [
          // Available packages in row
        Row(
          children: _availablePackages.map((package) {
            final isSelected = _selectedPackage?.identifier == package.identifier;
            final isYearly = package.packageType == PackageType.annual;
            final discountPercent = _calculateDiscountPercent(package);
            
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: _availablePackages.indexOf(package) == 0 ? 8 : 0,
                  left: _availablePackages.indexOf(package) == 1 ? 8 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPackage = package;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? CupertinoColors.systemGreen.withValues(alpha: 0.1)
                              : CupertinoColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected 
                                ? CupertinoColors.systemGreen
                                : CupertinoColors.systemGrey4,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left column: Package type and price
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Package type
                                  Text(
                                    isYearly ? 'Yearly' : 'Monthly',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected 
                                          ? CupertinoColors.systemGreen
                                          : CupertinoColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  
                                  // Price
                                  Text(
                                    _getFormattedPrice(package),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected 
                                          ? CupertinoColors.systemGreen
                                          : CupertinoColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  
                                  // Billing info
                                  Text(
                                    _getBillingInfo(package),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Right side: Selection indicator
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected 
                                    ? CupertinoColors.systemGreen
                                    : CupertinoColors.white,
                                border: Border.all(
                                  color: isSelected 
                                      ? CupertinoColors.systemGreen
                                      : CupertinoColors.systemGrey4,
                                  width: 2,
                                ),
                              ),
                              child: isSelected
                                  ? const Icon(
                                      CupertinoIcons.checkmark,
                                      size: 12,
                                      color: CupertinoColors.white,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      // Discount badge positioned on the border
                      if (isYearly && discountPercent > 0)
                        Positioned(
                          top: -8,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGreen,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: CupertinoColors.white,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              '${discountPercent.toStringAsFixed(0)}% OFF',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _getFormattedPrice(Package package) {
    if (package.packageType == PackageType.annual) {
      // Calculate monthly equivalent for yearly
      final yearlyPrice = package.storeProduct.price;
      final monthlyPrice = yearlyPrice / 12;
      return '\$${monthlyPrice.toStringAsFixed(2)}/mo';
    } else {
      return package.storeProduct.priceString;
    }
  }

  String _getBillingInfo(Package package) {
    if (package.packageType == PackageType.annual) {
      return 'Billed at ${package.storeProduct.priceString}/yr.';
    } else {
      return 'Billed at ${package.storeProduct.priceString}/mo.';
    }
  }

  double _calculateDiscountPercent(Package package) {
    if (package.packageType != PackageType.annual) return 0;
    
    // Find the monthly package to compare
    final monthlyPackage = _availablePackages.firstWhere(
      (p) => p.packageType == PackageType.monthly,
      orElse: () => package,
    );
    
    if (monthlyPackage == package) return 0;
    
    // Calculate discount: (monthly * 12 - yearly) / (monthly * 12) * 100
    final monthlyPrice = monthlyPackage.storeProduct.price;
    final yearlyPrice = package.storeProduct.price;
    final monthlyYearlyEquivalent = monthlyPrice * 12;
    
    if (monthlyYearlyEquivalent <= yearlyPrice) return 0;
    
    final discount = ((monthlyYearlyEquivalent - yearlyPrice) / monthlyYearlyEquivalent) * 100;
    return discount;
  }

  Widget _buildDisclaimerText() {
    return const Text(
      'No Commitment, Cancel Anytime',
      style: TextStyle(
        fontSize: 14,
        color: CupertinoColors.systemGrey,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCTAButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: CupertinoButton(
        onPressed: _isLoading ? null : _startTrial,
        color: CupertinoColors.systemGreen,
        borderRadius: BorderRadius.circular(25),
        child: _isLoading
            ? const CupertinoActivityIndicator(color: CupertinoColors.white)
            : const Text(
                '7 day free trial',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildFooterLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CupertinoButton(
          onPressed: _restorePurchases,
          child: const Text(
            'Restore Purchases',
            style: TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemBlue,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: _openPrivacyPolicy,
          child: const Text(
            'Terms',
            style: TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemBlue,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: _openPrivacyPolicy,
          child: const Text(
            'Privacy',
            style: TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemBlue,
            ),
          ),
        ),
      ],
    );
  }
}
