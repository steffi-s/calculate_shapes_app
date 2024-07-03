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
              child: Text(
                'Results for $shape',
                // style: TextStyle(...),
              ),
            ),
            ListView.builder(
              itemCount: results.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(readKeys()[index]),
                    Text(readValues()[index].toStringAsFixed(2)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
