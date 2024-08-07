abstract class Shape {
  String name;

  /// [Shape] is a basic definition for all shapes.
  ///
  /// Every [Shape] must have a [name].
  Shape({
    required this.name,
  });

  /// The circumference of a [Shape] is needed for knowing how many fence
  /// elements must be acquired.
  ///
  /// The calculated circumference is returned as [double] so that extending
  /// classes can add decimal digits.
  double calculateCircumference();

  /// The area of a [Shape] is needed, to know how much concrete is required
  /// for the floor.
  ///
  /// The calculated area is returned as [double] so that extending classes can
  /// add decimal digits.
  double calculateArea();
}
