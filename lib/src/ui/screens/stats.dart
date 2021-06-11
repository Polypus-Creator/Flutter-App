import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int _monthViews = 345;
  int _timesBuilt = 42;

  List<StatsData> data = [
    StatsData(DateTime(2020, 12), 301),
    StatsData(DateTime(2021, 1), 354),
    StatsData(DateTime(2021, 2), 284),
    StatsData(DateTime(2021, 3), 343),
    StatsData(DateTime(2021, 4), 327),
    StatsData(DateTime(2021, 5), 404),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Row(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Visitas este mes",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text("$_monthViews",
                          style: Theme.of(context).textTheme.headline3)
                    ],
                  ),
                ),
              ),
              Spacer(),
              Image.asset(
                "assets/logo.png",
                width: 100,
              ),
              Spacer(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Veces generada",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text("$_timesBuilt",
                          style: Theme.of(context).textTheme.headline3)
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Card(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              enableAxisAnimation: true,
              // Chart title
              title: ChartTitle(
                text: "Visitas últimos 6 meses",
              ),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: [
                LineSeries<StatsData, String>(
                  dataSource: data,
                  xValueMapper: (StatsData stats, _) => DateFormat.MMM(
                          Localizations.localeOf(context).languageCode)
                      .format(stats.date),
                  yValueMapper: (StatsData stats, _) => stats.siteViews,
                  name: 'Visitas',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsData {
  StatsData(this.date, this.siteViews);

  final DateTime date;
  final double siteViews;
}
