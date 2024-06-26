import 'package:calculate_shapes_app/screens/greeting.dart';
import 'package:flutter/material.dart';

class Calculation extends StatelessWidget {
  Calculation({required this.shape, super.key});

  ShapeLabel shape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(shape.name),
            const Row(
              children: [
                Text('Calculate Area'),
                Text('Side A'),
                Text('Side B'),
                TextButton(
                  onPressed: null,
                  child: Text('Calculate'),
                ),
              ],
            ),
          const Row(),
          ],
        ),
      ),
    );
  }
}
