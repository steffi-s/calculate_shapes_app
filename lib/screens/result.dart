import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({required this.shape, required this.results, super.key});

  final String shape;
  final Map<String, dynamic> results;

List<String> readKeys() {
  List<String> keys = [];
  for (var key in results.keys) {
    keys.add(key);
  }
  return keys;
}

List<double> readValues() {
  List<double> values = [];
  for (var value in results.values) {
    values.add(value);
  }
  return values;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Results for "${shape.toUpperCase()}"',
                   style: const TextStyle(
                     color: Colors.teal,
                     fontSize: 24,
                     fontWeight: FontWeight.bold,
                   ),
                ),
              ),
            ),
            Center(
              child: ListView.builder(
                itemCount: results.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                                readKeys()[index]),
                        ),
                        Text(readValues()[index].toStringAsFixed(2)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
