import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

class JoystickWidget extends StatefulWidget {
  const JoystickWidget({
    required this.viewModel,
    required this.onHorizontalChanged,
    required this.onVerticalChanged,
    super.key,
  });
  final ControlPadViewModel viewModel;
  final void Function(double y) onHorizontalChanged;
  final void Function(double x) onVerticalChanged;

  @override
  State<JoystickWidget> createState() => _JoystickWidgetState();
}

class _JoystickWidgetState extends State<JoystickWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Joystick(
              mode: JoystickMode.vertical,
              base: const FittedBox(
                fit: BoxFit.contain,
                child: Image(
                  image: AssetImage(
                    'assets/vertical-arrow.png',
                  ),
                  width: 150,
                  height: 150,
                ),
              ),
              stick: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow.shade900,
                ),
              ),
              listener: (StickDragDetails details) {
                final double yValue = widget.viewModel.onHorizontalChanged(details.y);
                widget.onHorizontalChanged(yValue);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Joystick(
              mode: JoystickMode.horizontal,
              base: const FittedBox(
                fit: BoxFit.contain,
                child: Image(
                  image: AssetImage(
                    'assets/horizontal-arrow.png',
                  ),
                  width: 150,
                  height: 150,
                ),
              ),
              stick: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow.shade900,
                ),
              ),
              listener: (StickDragDetails details) {
                final double xValue = widget.viewModel.onVerticalChanged(details.x);
                widget.onVerticalChanged(xValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
