import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({required this.shape, required this.results, super.key});

  final String shape;
  final List<double> results;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Results are in!'),
    );
  }
}
