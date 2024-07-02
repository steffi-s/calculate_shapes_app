import 'package:flutter/material.dart';

import 'calculation.dart';

enum ShapeLabel {
  rectangle,
  circle,
}

class Greeting extends StatelessWidget {
  const Greeting({required this.greeting, super.key});

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Text(
                  greeting,
                  style: const TextStyle(
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

class ShapeDropdown extends StatefulWidget {
  const ShapeDropdown({super.key});

  @override
  State<ShapeDropdown> createState() => _ShapeDropdownState();
}

class _ShapeDropdownState extends State<ShapeDropdown> {
  final TextEditingController _shapeController = TextEditingController();

  ShapeLabel _selectedShape = ShapeLabel.rectangle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownMenu<ShapeLabel>(
          initialSelection: ShapeLabel.rectangle,
          controller: _shapeController,
          requestFocusOnTap: true,
          label: const Text('Shape'),
          onSelected: (label) {
            setState(() {
              _selectedShape = label!;
              debugPrint(_selectedShape.name);
            });
          },
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: ShapeLabel.rectangle, label: 'Rectangle'),
            DropdownMenuEntry(value: ShapeLabel.circle, label: 'Circle'),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ConfirmButton(
              shapeName: _selectedShape.name,
            )),
      ],
    );
  }

  @override
  void dispose() {
    _shapeController.dispose();
    super.dispose();
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({required this.shapeName, super.key});

  final String shapeName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('Confirm Selection'),
        onPressed: () {
          debugPrint('shapeName: $shapeName');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => Calculation(shape: shapeName),
            ),
          );
        });
  }
}
