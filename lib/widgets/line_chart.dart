import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
      maxX: 14,
      minY: 0,
      maxY: 4,
    );

FlTitlesData get titlesData => FlTitlesData(
      // draws the x and y axis
      bottomTitles: AxisTitles(sideTitles: bottomTitles),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
      ),
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
    case 2:
      text = const Text(
        '2021',
        style: style,
      );
      break;
    case 7:
      text = const Text(
        '2022',
        style: style,
      );
      break;
    case 12:
      text = const Text(
        '2023',
        style: style,
      );
      break;
    case 17:
      text = const Text(
        '2024',
        style: style,
      );
      break;
    default:
      text = const Text('');
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 30,
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
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
            show: true, color: const Color.fromARGB(44, 183, 49, 206)),
        spots: const [
          FlSpot(0, 1.1),
          FlSpot(1, 1),
          FlSpot(2, 1.3),
          FlSpot(4, 1.5),
          FlSpot(5, 2.1),
          FlSpot(7, 2.2),
          FlSpot(8, 1.8),
          FlSpot(10, 2.1),
          FlSpot(13, 2.6),
        ]);
