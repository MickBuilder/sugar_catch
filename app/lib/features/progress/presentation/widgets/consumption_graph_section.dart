import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sugar_catch/features/progress/data/progress_models.dart';

class ConsumptionGraphSection extends StatefulWidget {
  final List<ConsumptionDataPoint> consumptionData;
  final String selectedPeriod;
  final Function(String) onPeriodChanged;

  const ConsumptionGraphSection({
    super.key,
    required this.consumptionData,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  @override
  State<ConsumptionGraphSection> createState() => _ConsumptionGraphSectionState();
}

class _ConsumptionGraphSectionState extends State<ConsumptionGraphSection>
    with TickerProviderStateMixin {
  late AnimationController _graphAnimationController;
  late Animation<double> _graphFadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Graph fade animation
    _graphAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _graphFadeAnimation = CurvedAnimation(
      parent: _graphAnimationController,
      curve: Curves.easeInOut,
    );
    
    _graphAnimationController.forward();
  }

  @override
  void dispose() {
    _graphAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sugar Intake Trends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Period Selector
        _buildPeriodSelector(),
        
        const SizedBox(height: 16),
        
        // Statistics Card
        _buildStatisticsCard(),
        
        const SizedBox(height: 16),
        
        // Graph with animation
        FadeTransition(
          opacity: _graphFadeAnimation,
          child: _buildGraph(),
        ),
      ],
    );
  }

  Widget _buildPeriodSelector() {
    final periods = ['weekly', 'monthly', 'yearly'];
    
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6, // Light grey background
        borderRadius: BorderRadius.circular(20), // Pill shape
      ),
      child: Row(
        children: periods.map((period) {
          final isSelected = period == widget.selectedPeriod;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                // Animate graph when period changes
                _graphAnimationController.reset();
                _graphAnimationController.forward();
                
                widget.onPeriodChanged(period);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected 
                      ? CupertinoColors.systemGreen
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected 
                          ? CupertinoColors.white 
                          : CupertinoColors.label,
                    ),
                    child: Text(period.toUpperCase()),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatisticsCard() {
    // Calculate total sugar based on the selected period
    final totalSugar = widget.consumptionData.fold(0.0, (sum, point) => sum + point.sugarAmount);
    
    // Get period label for display
    String periodLabel;
    switch (widget.selectedPeriod) {
      case 'weekly':
        periodLabel = 'This Week';
        break;
      case 'monthly':
        periodLabel = 'This Month';
        break;
      case 'yearly':
        periodLabel = 'This Year';
        break;
      default:
        periodLabel = 'This Month';
    }
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Total Sugar Intake
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Sugar Intake',
              style: const TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${totalSugar.toStringAsFixed(0)}g',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.label,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              periodLabel,
              style: const TextStyle(
                fontSize: 12,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
        
        // Change - Commented out for now
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     const Text(
        //       'Last 30 Days',
        //       style: TextStyle(
        //         fontSize: 14,
        //         color: CupertinoColors.systemGrey,
        //       ),
        //     ),
        //     const SizedBox(height: 4),
        //     Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Icon(
        //           CupertinoIcons.arrow_down,
        //           color: CupertinoColors.systemGreen,
        //           size: 16,
        //         ),
        //         const SizedBox(width: 4),
        //         Text(
        //           '${change.abs().toStringAsFixed(0)}%',
        //           style: const TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //             color: CupertinoColors.systemGreen,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildGraph() {
    if (widget.consumptionData.isEmpty) {
      return SizedBox(
        height: 200,
        child: const Center(
          child: Text(
            'No data available',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: _buildFlChart(),
    );
  }

  Widget _buildFlChart() {
    final maxValue = widget.consumptionData.map((e) => e.sugarAmount).reduce((a, b) => a > b ? a : b);
    final minValue = 0.0;
    
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
                     getTitlesWidget: (double value, TitleMeta meta) {
                       final index = value.toInt();
                       if (index >= 0 && index < widget.consumptionData.length) {
                         return Text(
                           widget.consumptionData[index].periodLabel,
                    style: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: _calculateYAxisInterval(maxValue),
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '${value.toStringAsFixed(0)}g',
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
               minX: 0,
               maxX: (widget.consumptionData.length - 1).toDouble(),
        minY: minValue,
        maxY: maxValue * 1.1, // Add some padding at the top
        lineBarsData: [
          LineChartBarData(
            spots: widget.consumptionData.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.sugarAmount);
            }).toList(),
            isCurved: true,
            preventCurveOverShooting: true,
            gradient: LinearGradient(
              colors: [
                CupertinoColors.systemGreen,
                CupertinoColors.systemGreen.withOpacity(0.8),
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: CupertinoColors.systemGreen,
                  strokeWidth: 2,
                  strokeColor: CupertinoColors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  CupertinoColors.systemGreen.withOpacity(0.3),
                  CupertinoColors.systemGreen.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) => CupertinoColors.systemBackground,
            tooltipPadding: const EdgeInsets.all(8),
            tooltipBorder: BorderSide(
              color: CupertinoColors.separator,
              width: 1,
            ),
                   getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                     return touchedBarSpots.map((barSpot) {
                       final index = barSpot.x.toInt();
                       if (index >= 0 && index < widget.consumptionData.length) {
                         return LineTooltipItem(
                           '${widget.consumptionData[index].periodLabel}\n${barSpot.y.toStringAsFixed(1)}g',
                    const TextStyle(
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return null;
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  double _calculateYAxisInterval(double maxValue) {
    if (maxValue <= 0) return 1.0;
    
    // Calculate appropriate interval based on max value
    if (maxValue <= 10) {
      return 2.0; // For small values, show every 2g
    } else if (maxValue <= 50) {
      return 5.0; // For medium values, show every 5g
    } else if (maxValue <= 100) {
      return 10.0; // For larger values, show every 10g
    } else {
      return 20.0; // For very large values, show every 20g
    }
  }
}
