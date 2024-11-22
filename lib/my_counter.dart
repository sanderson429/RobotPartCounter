import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCounter extends StatefulWidget {
  final IconData mainButtonIcon;
  final String mainButtonText;
  final int desiredValue;
  final void Function(int newValue)? onMainButtonPressed;
  final void Function(int newValue)? onSubtractButtonPressed;

  const MyCounter({
    super.key,
    required this.mainButtonIcon,
    required this.mainButtonText,
    required this.desiredValue,
    this.onMainButtonPressed,
    this.onSubtractButtonPressed,
  });

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  var _count = 0;
  var _reset = false;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
    _reset = context.read<ResetCounterProvider>().reset;
    if (widget.onMainButtonPressed != null) widget.onMainButtonPressed!(_count);
  }

  void _subtractCounter() {
    setState(() {
      if (_count > 0) _count--;
    });
    _reset = context.read<ResetCounterProvider>().reset;
    if (widget.onSubtractButtonPressed != null) {
      widget.onSubtractButtonPressed!(_count);
    }
  }

  @override
  Widget build(BuildContext context) {
    final reset = context.watch<ResetCounterProvider>().reset;
    if (reset != _reset) _count = 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              onPressed: _subtractCounter,
              elevation: 0.0,
              fillColor: Colors.red,
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.remove_circle,
                size: 28.0,
                color: Colors.white,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              ),
              icon: Icon(
                widget.mainButtonIcon,
                color: Colors.white,
                size: 30.0,
              ),
              label: Text(
                widget.mainButtonText,
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
              onPressed: _incrementCounter,
            ),
          ],
        ),
        Text(
          '$_count/${widget.desiredValue}',
          style: const TextStyle(
            color: Colors.black12,
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
            fontSize: 36,
          ),
        ),
      ],
    );
  }
}

class ResetCounterProvider with ChangeNotifier {
  bool _reset = false;

  bool get reset => _reset;

  void triggerReset() {
    _reset = !_reset;
    notifyListeners();
  }
}
