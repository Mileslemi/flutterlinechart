class ProfitPoint {
  // points for yearly profits to map on graph
  final double x;
  final double y;

  ProfitPoint({required this.x, required this.y});
}

List<ProfitPoint> get yearlyProfitPoints {
  // last seven years in millions from oldest to current
  final data = <double>[2.5, 3, 2.2, 4, 1.8, 1.2, 2.1];
  return data
      .asMap()
      .entries
      .map((entry) => ProfitPoint(x: entry.key.toDouble(), y: entry.value))
      .toList();
}
