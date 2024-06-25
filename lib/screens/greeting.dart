import 'package:flutter/material.dart';

import '../widgets/shape_dropdown.dart';

class Greeting extends StatelessWidget {
  const  Greeting({required this.greeting, super.key});

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
      child: Center(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 64.0),
               child: Text(
               greeting,
                style:const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
                           ),
             ),
           const Padding(
             padding: EdgeInsets.only(top: 16, bottom: 12),
             child: ShapeDropdown(),
           ),
          ],
        ),
      ),
      ),
    );
  }
}
