import 'package:calculate_shapes_app/screens/greeting.dart';
import 'package:flutter/material.dart';

class Calculation extends StatelessWidget {
  const Calculation({required this.shape, super.key});

  final ShapeLabel shape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Calculate your ${shape.name.toUpperCase()}'),
            ],
          ),
        ),
      ),
    );
  }
}
