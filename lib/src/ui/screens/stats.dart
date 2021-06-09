import 'package:flutter/material.dart';
import 'package:polypus_app/src/ui/screens/settings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  //CIRCULAR EJEMPLO

  late List<GDPData> _charData;

  @override
  void initState() {
    _charData = getChartData();
    super.initState();
  }

  //CIRCULAR
  List<GDPData> getChartData() {
    final List<GDPData> charData = [
      GDPData('AMERICA', 35),
      GDPData('EUROPA', 28),
      GDPData('OCEANIA', 34),
      GDPData('ASIA', 32),
      GDPData('AFRICA', 40)
    ];
    return charData;
  }

  //---------------------------------------------------------------------------------
  //DATOS QUE SE INTRODUCIRAN PUESTOS EN LISTAS
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  List<ChartData> chartData = [
    ChartData("Jun", 35),
    ChartData("July", 28),
    ChartData("Ago", 34),
    ChartData("sep", 32),
    ChartData("Oct", 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Graficos"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _password();
                },
                icon: Icon(Icons.settings))
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 35),
            elevation: 15,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(
                  text: 'Half yearly sales analysis',
                ),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
          //-------------------------------------------------------------------------------------------------
          //CIRCULAR GRAPHICS Creacion
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 35),
            elevation: 15,
            child: SfCircularChart(
              title: ChartTitle(text: 'Visitas cada tres meses'),
              series: <CircularSeries>[
                PieSeries<GDPData, String>(
                    //ESTO ES PARA MOSTRAR LOS DATOS
                    dataSource: _charData,
                    xValueMapper: (GDPData data, _) => data.continent,
                    yValueMapper: (GDPData data, _) => data.gdp,
                    //ESTO ES PARA MOSTRAR LOS LABELS
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                    )),
              ],
            ),
          ),
        ]));
  }

  void _password() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.yearB, this.salesB);

  final String yearB;
  final double salesB;
}

class GDPData {
  final String continent;
  final int gdp;

  GDPData(this.continent, this.gdp);
}
