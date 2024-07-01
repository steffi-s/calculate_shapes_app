import 'package:calculate_shapes_app/models/rectangle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final positiveRect = Rectangle(
    name: 'positive rect',
    sideA: 10.0,
    sideB: 30.0,
  );
  final zeroRect = Rectangle(
    name: 'zero rect',
    sideA: 0.0,
    sideB: 0.0,
  ); // this should not work!
  final negativeRect = Rectangle(
    name: 'negative rect',
    sideA: -5.0,
    sideB: -3.0,
  ); // this should not work!
  final wholeNumbersRect = Rectangle(
    name: 'whole numbers rect',
    sideA: 7,
    sideB: 15,
  );
  group('test Rectangle', () {
    test('constructor should initialize properties', () {
      expect(positiveRect.name, 'positive rect');
      expect(positiveRect.sideA, 10.0);
      expect(positiveRect.sideB, 30.0);

      expect(zeroRect.name, 'zero rect');
      expect(zeroRect.sideA, 0.0);
      expect(zeroRect.sideB, 0.0);

      expect(negativeRect.name, 'negative rect');
      expect(negativeRect.sideA, -5.0);
      expect(negativeRect.sideB, -3.0);

      expect(wholeNumbersRect.name, 'whole numbers rect');
      expect(wholeNumbersRect.sideA, 7);
      expect(wholeNumbersRect.sideB, 15);
    });
    test('calculateArea should calculate the area correctly', () {
      expect(positiveRect.calculateArea(), 300.0);
      expect(zeroRect.calculateArea(), 0.0);
      expect(negativeRect.calculateArea(), 15.0);
      expect(wholeNumbersRect.calculateArea(), 105);
    });
    test('calculateCircumference should calculate the circumference correctly',
        () {
      expect(positiveRect.calculateCircumference(), 80.0);
      expect(zeroRect.calculateCircumference(), 0.0);
      expect(negativeRect.calculateCircumference(), -16.0);
      expect(wholeNumbersRect.calculateCircumference(), 44);
    });
  });
}
