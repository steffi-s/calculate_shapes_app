import 'dart:math';

import 'shape.dart';

/// The [Circle] is a specific kind of [Shape].
///
/// It needs a [radius] for the calculations to work.
class Circle extends Shape {
  /// The [radius] is expected to be a double to avoid casting.
  double radius;

  Circle({
    required super.name,
    required this.radius,
  });

  @override
  double calculateArea() {
    var area = pi * radius * radius;
    return double.parse(area.toStringAsFixed(2));
  }

  @override
  double calculateCircumference() {
    var circumference = 2 * pi * radius;
    return double.parse(circumference.toStringAsFixed(2));
  }
}
