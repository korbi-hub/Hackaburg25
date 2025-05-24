import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/stats/model/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SfCartesianChart(
            title: ChartTitle(text: context.translate.kilometersLastMonth),
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(labelFormat: '{value} km'),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: [
              ColumnSeries<ChartData, String>(
                dataSource: ChartData.chartDataList,
                xValueMapper: (ChartData data, _) => data.name,
                yValueMapper: (ChartData data, _) => data.value,
                name: 'Kilometers',
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              context.translate.monthlyStats,
              style: context.textTheme.bodyLarge,
            ),
          ),
          for (final statValue in ChartData.bikeStatsChartData) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(statValue.icon!),
                      ),
                      Text(
                        statValue.name,
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Text(
                    statValue.value.toString(),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (statValue != ChartData.bikeStatsChartData.last)
              Divider(color: Colors.grey.withOpacity(0.05)),
          ],
        ],
      ),
    );
  }
}
