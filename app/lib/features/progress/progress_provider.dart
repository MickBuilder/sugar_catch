import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/features/progress/data/progress_models.dart';
import 'package:sweetr/features/progress/data/progress_service.dart';

part 'progress_provider.g.dart';

@riverpod
class ProgressNotifier extends _$ProgressNotifier {
  @override
  ProgressData build() {
    return _loadProgressData();
  }

  ProgressData _loadProgressData() {
    final statistics = ProgressService.getStatistics();
    final achievements = ProgressService.getAchievements();
    final consumptionData = ProgressService.getConsumptionData('monthly');
    
    return ProgressData(
      statistics: statistics,
      achievements: achievements,
      consumptionData: consumptionData,
      selectedPeriod: 'monthly',
    );
  }

  // Update selected period
  void updateSelectedPeriod(String period) {
    final currentData = state;
    final newConsumptionData = ProgressService.getConsumptionData(period);
    
    state = currentData.copyWith(
      selectedPeriod: period,
      consumptionData: newConsumptionData,
    );
  }

  // Refresh progress data
  void refreshProgressData() {
    state = _loadProgressData();
  }
}

// Provider for getting progress statistics
@riverpod
ProgressStatistics progressStatistics(Ref ref) {
  return ProgressService.getStatistics();
}

// Provider for getting achievements
@riverpod
List<Achievement> achievements(Ref ref) {
  return ProgressService.getAchievements();
}

// Provider for getting consumption data
@riverpod
List<ConsumptionDataPoint> consumptionData(Ref ref, String period) {
  return ProgressService.getConsumptionData(period);
}
