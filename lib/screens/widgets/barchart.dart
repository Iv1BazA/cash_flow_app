import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartPage extends StatefulWidget {
  int selectedRange;
  BarChartPage({super.key, required this.selectedRange});
  @override
  State<BarChartPage> createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: getBarChart(),
          ),
        ),
      ],
    );
  }

  Widget getBarChart() {
    switch (widget.selectedRange) {
      case 1:
        return BarChartWidget(
          data: [7, 22, 8, 13, 11, 15, 6],
          labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        );
      case 2:
        return BarChartWidget(
          data: [10, 15, 7, 20],
          labels: ['W1', 'W2', 'W3', 'W4'],
        );
      case 0:
      default:
        return BarChartWidget(
          data: [20],
          labels: ['Today'],
        );
    }
  }
}

class BarChartWidget extends StatelessWidget {
  final List<int> data;
  final List<String> labels;

  const BarChartWidget({required this.data, required this.labels});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: data.map((value) {
                  return Container(
                    width: 32,
                    height: 157,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  );
                }).toList(),
              ),
            ),
            BarChart(
              BarChartData(
                barGroups: data
                    .asMap()
                    .map((index, value) => MapEntry(
                          index,
                          BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY: value.toDouble(),
                                width: 32,
                                color: primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ],
                          ),
                        ))
                    .values
                    .toList(),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            labels[value.toInt()],
                            style: discription.copyWith(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barTouchData: BarTouchData(enabled: false),
                alignment: BarChartAlignment.spaceAround,
                maxY: 25,
              ),
            ),
          ],
        );
      },
    );
  }
}
