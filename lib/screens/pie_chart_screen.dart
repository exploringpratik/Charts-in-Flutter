import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('USA', 8, '50%',Color(0xFFFFC501)),
    ChartData('China', 4, '60%', Color(0xFFD22828)),
    ChartData('Russia', 9, '52%',Colors.purple),
    ChartData('Germany', 10, '40%',Colors.blue)
  ];

  final List<ChartDataDoughnut> chartDataDoughnut = [
    ChartDataDoughnut('David', 8, Color(0xFFFFC501)),
    ChartDataDoughnut('Steve', 4, Color(0xFFD22828)),
    ChartDataDoughnut('Jack', 9, Colors.purple),
    ChartDataDoughnut('Others', 10, Colors.blue)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          height: 250,
          child: SfCircularChart(series: <CircularSeries>[
            PieSeries<ChartData, String>(
                pointColorMapper: (ChartData data, _) => data.color,
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                // Radius for each segment from data source
                pointRadiusMapper: (ChartData data, _) => data.size),

          ]),
        ),
        Container(
          height: 250,
            child: SfCircularChart(series: <CircularSeries>[
          // Renders doughnut chart
          DoughnutSeries<ChartDataDoughnut, String>(
              opacity: 0.5,
              dataSource: chartDataDoughnut,
              pointColorMapper: (ChartDataDoughnut data, _) => data.color,
              xValueMapper: (ChartDataDoughnut data, _) => data.x,
              yValueMapper: (ChartDataDoughnut data, _) => data.y)
        ])),

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.infinity,
                height: 250,
                child: SfCircularChart(series: <CircularSeries>[
                  PieSeries<ChartData, String>(
                      pointColorMapper: (ChartData data, _) => data.color,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      // Radius for each segment from data source
                      pointRadiusMapper: (ChartData data, _) => data.size),

                ]),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 250,
                  child: SfCircularChart(series: <CircularSeries>[
                    // Renders doughnut chart
                    DoughnutSeries<ChartDataDoughnut, String>(
                        opacity: 0.5,
                        dataSource: chartDataDoughnut,
                        pointColorMapper: (ChartDataDoughnut data, _) => data.color,
                        xValueMapper: (ChartDataDoughnut data, _) => data.x,
                        yValueMapper: (ChartDataDoughnut data, _) => data.y)
                  ])),
            ),


      ])),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size,[this.color]);

  final String x;
  final double y;
  final String size;
  final Color color;
}

class ChartDataDoughnut {
  ChartDataDoughnut(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color color;
}
