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
              shape: _selectedShape,
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
  const ConfirmButton({required this.shape, super.key});

  final ShapeLabel shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Confirm Selection'),
      onPressed: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Calculation(shape: shape),
        ),
      ),
    );
  }
}
