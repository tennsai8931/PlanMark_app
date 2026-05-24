class Point {
  final int id;
  final String name;
  final double x;
  final double y;
  final String note;

  Point({
    required this.id,
    required this.name,
    required this.x,
    required this.y,
    required this.note,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      id: json['id'],
      name: json['name'] ?? '',
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      note: json['note'] ?? '',
    );
  }
}