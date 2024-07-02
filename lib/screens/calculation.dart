import 'package:calculate_shapes_app/models/circle.dart';
import 'package:calculate_shapes_app/models/rectangle.dart';
import 'package:flutter/material.dart';

class Calculation extends StatelessWidget {
  const Calculation({required this.shape, super.key});

  final String shape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  shape.toUpperCase(),
                ),
                shape == 'rectangle'
                    ? RectangleFormDisplay(name: shape)
                    : CircleFormDisplay(name: shape)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RectangleFormDisplay extends StatefulWidget {
  const RectangleFormDisplay({required this.name, super.key});

  final String name;

  @override
  State<RectangleFormDisplay> createState() => _RectangleFormDisplayState();
}

class _RectangleFormDisplayState extends State<RectangleFormDisplay> {
  final _sideAController = TextEditingController();
  final _sideBController = TextEditingController();
  final _rectFormKey = GlobalKey();

  Rectangle _createRectangle(double sideA, double sideB) =>
      Rectangle(name: widget.name, sideA: sideA, sideB: sideB);

  double _calculateArea(double sideA, double sideB) {
    var rect = _createRectangle(sideA, sideB);
    return rect.calculateArea();
  }

  double _calculateCircumference(double sideA, double sideB) {
    var rect = _createRectangle(sideA, sideB);
    return rect.calculateCircumference();
  }

  @override
  void initState() {
    _sideBController.text = '';
    _sideBController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _rectFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _sideAController,
                  decoration: const InputDecoration(
                    hintText: 'Side A',
                    hintStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 12,
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _sideAController.text = value;
                    });
                  },
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _sideBController,
                  decoration: const InputDecoration(
                    hintText: 'Side B',
                    hintStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 12,
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _sideBController.text = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      var area = _calculateArea(
                        double.parse(_sideAController.text),
                        double.parse(_sideBController.text),
                      );
                      debugPrint('$area');
                    },
                    child: const Text(
                      'Calculate Area',
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      var circumference = _calculateCircumference(
                        double.parse(_sideAController.text),
                        double.parse(_sideBController.text),
                      );
                      debugPrint('$circumference');
                    },
                    child: const Text(
                      'Calculate Circumference',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ElevatedButton(
              onPressed: () {
                var area = _calculateArea(
                  double.parse(_sideAController.text),
                  double.parse(_sideBController.text),
                );
                var circumference = _calculateCircumference(
                  double.parse(_sideAController.text),
                  double.parse(_sideBController.text),
                );
                debugPrint('Area: $area, Circumference: $circumference');
              },
              child: const Text('Calculate Both'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _sideAController.dispose();
    _sideBController.dispose();
    super.dispose();
  }
}

class CircleFormDisplay extends StatefulWidget {
  const CircleFormDisplay({required this.name, super.key});

  final String name;

  @override
  State<CircleFormDisplay> createState() => _CircleFormDisplayState();
}

class _CircleFormDisplayState extends State<CircleFormDisplay> {
  final _radiusController = TextEditingController();
  final _circleFormKey = GlobalKey();

  Circle _createCircle(double radius) => Circle(
        name: widget.name,
        radius: radius,
      );

  double _calculateArea(double radius) {
    return _createCircle(radius).calculateArea();
  }

  double _calculateCircumference(double radius) {
    return _createCircle(radius).calculateCircumference();
  }

  @override
  void initState() {
    _radiusController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _circleFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _radiusController,
            decoration: const InputDecoration(
              hintText: 'Radius',
              hintStyle: TextStyle(
                color: Colors.teal,
                fontSize: 12,
              ),
            ),
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      var area =
                          _calculateArea(double.parse(_radiusController.text));
                      debugPrint('Area: $area');
                    },
                    child: const Text('Calculate Area'),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      var circumference = _calculateCircumference(
                          double.parse(_radiusController.text));
                      debugPrint('Circumference: $circumference');
                    },
                    child: const Text('Calculate Circumference'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ElevatedButton(
              onPressed: () {
                var area = _calculateArea(
                  double.parse(_radiusController.text),
                );
                var circumference = _calculateCircumference(
                  double.parse(_radiusController.text),
                );
                debugPrint('Area: $area, Circumference: $circumference');
              },
              child: const Text('Calculate Both'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }
}
