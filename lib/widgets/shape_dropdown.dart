import 'package:flutter/material.dart';

enum ShapeLabel {
  rectangle,
  circle,
}

class ShapeDropdown extends StatefulWidget {
  const ShapeDropdown({super.key});

  @override
  State<ShapeDropdown> createState() => _ShapeDropdownState();
}

class _ShapeDropdownState extends State<ShapeDropdown> {
  final TextEditingController _shapeController = TextEditingController();

  ShapeLabel? selectedLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownMenu<ShapeLabel> (
          initialSelection: ShapeLabel.rectangle,
          controller: _shapeController,
          requestFocusOnTap: true,
          label: const Text('Shape'),
          onSelected: (ShapeLabel? label) {
            setState(() {
              selectedLabel = label;
            });
          },
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: ShapeLabel.rectangle, label: 'Rectangle'),
            DropdownMenuEntry(value: ShapeLabel.circle, label: 'Circle'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            'Shape: ${selectedLabel?.name}',
          ),
        ),
      ],
    );
  }
}
