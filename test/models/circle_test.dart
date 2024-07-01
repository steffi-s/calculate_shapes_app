import 'package:calculate_shapes_app/models/circle.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  final circle = Circle(name: 'circle', radius: 5.0);
  group('Circle test', () {
    test('Constructor should initialize properties', () {
      expect(circle.name, 'circle');
      expect(circle.radius, 5.0);
    });
    test('should calculate area correctly', () {
      expect(circle.calculateArea(), 78.54);
    });
    test('should calculate circumference correctly', () {
      expect(circle.calculateCircumference(), 31.42);
    });
  });
}
