import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/yearly_profit_points.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
        swapAnimationDuration: const Duration(milliseconds: 250),
        lineChartData);
  }
}

LineChartData get lineChartData => LineChartData(
      gridData: gridData,
      titlesData: titlesData,
      borderData: borderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 4,
    );

FlTitlesData get titlesData => FlTitlesData(
      // draws the x and y axis
      bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
          axisNameWidget: const Text(
            'Years',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          )),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
          sideTitles: leftTitles(),
          axisNameWidget: const Text('Ksh (Millions)',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ))),
    );

Widget leftTitlesWidget(double value, TitleMeta meta) {
  // creating the y axis labels widgets
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  String text;
  switch (value.toInt()) {
    case 1:
      text = "1m";
      break;
    case 2:
      text = "2m";
      break;
    case 3:
      text = "3m";
      break;
    case 4:
      text = "4m";
      break;
    case 5:
      text = "5m";
      break;
    default:
      return Container();
  }
  return Text(
    text,
    style: style,
    textAlign: TextAlign.center,
  );
}

SideTitles leftTitles() => SideTitles(
      getTitlesWidget: leftTitlesWidget,
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );

Widget bottomTitlesWidget(double value, TitleMeta meta) {
  // creating the y axis labels widgets
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        "'17",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "'18",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "'19",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "'20",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "'21",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "'22",
        style: style,
      );
      break;
    case 6:
      text = const Text(
        "'23",
        style: style,
      );
      break;
    default:
      text = const Text(' ');
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8,
    child: text,
  );
}

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 40,
      interval: 1,
      getTitlesWidget: bottomTitlesWidget,
    );

FlGridData get gridData => FlGridData(show: false);

FlBorderData get borderData => FlBorderData(
    // the borders
    show: true,
    border: const Border(
      bottom: BorderSide(color: Color.fromARGB(255, 131, 130, 130), width: 2),
      left: BorderSide(color: Color.fromARGB(255, 131, 130, 130), width: 2),
      top: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
    ));

List<LineChartBarData>? lineBarsData = [linechartbardata1];

LineChartBarData get linechartbardata1 => LineChartBarData(
    isCurved: true,
    color: Colors.purple,
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(show: true),
    belowBarData:
        BarAreaData(show: true, color: const Color.fromARGB(44, 183, 49, 206)),
    spots: yearlyProfitPoints.map((e) => FlSpot(e.x, e.y)).toList());
