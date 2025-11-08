/// Onboarding route names and navigation helpers
class OnboardingRoutes {
  static const String base = '/onboarding';
  
  // Individual onboarding page routes
  static const String welcome = '$base/welcome';
  static const String gender = '$base/gender';
  static const String discovery = '$base/discovery';
  static const String healthyTaste = '$base/healthy_taste';
  static const String comfortEating = '$base/comfort_eating';
  static const String frequency = '$base/frequency';
  static const String stressEating = '$base/stress_eating';
  static const String age = '$base/age';
  static const String boredomEating = '$base/boredom_eating';
  static const String personalizing = '$base/personalizing';
  static const String educationWeight = '$base/education_weight';
  static const String educationDisease = '$base/education_disease';
  static const String educationAnxiety = '$base/education_anxiety';
  static const String educationSupport = '$base/education_support';
  static const String featureScanning = '$base/feature_scanning';
  static const String featureAdditives = '$base/feature_additives';
  static const String testimonials = '$base/testimonials';
  static const String getStarted = '$base/get_started';
  
  /// All onboarding routes in order
  static const List<String> allRoutes = [
    welcome,
    gender,
    discovery,
    healthyTaste,
    comfortEating,
    frequency,
    stressEating,
    age,
    boredomEating,
    personalizing,
    educationWeight,
    educationDisease,
    educationAnxiety,
    educationSupport,
    featureScanning,
    featureAdditives,
    testimonials,
    getStarted,
  ];
  
  /// Get the next route for a given route
  static String? getNextRoute(String currentRoute) {
    final index = allRoutes.indexOf(currentRoute);
    if (index == -1 || index >= allRoutes.length - 1) {
      return null; // No next route
    }
    return allRoutes[index + 1];
  }
  
  /// Get the previous route for a given route
  static String? getPreviousRoute(String currentRoute) {
    final index = allRoutes.indexOf(currentRoute);
    if (index <= 0) {
      return null; // No previous route
    }
    return allRoutes[index - 1];
  }
  
  /// Get the index of a route
  static int getRouteIndex(String route) {
    return allRoutes.indexOf(route);
  }
  
  /// Get route name from path
  static String getRouteName(String route) {
    final parts = route.split('/');
    return parts.last;
  }
  
  /// Get screen name for analytics
  static String getScreenName(String route) {
    return getRouteName(route);
  }
}


