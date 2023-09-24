import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robo_controller/common/resources/assets.gen.dart';
import 'package:robo_controller/core/presentation/views/child_view_mixin.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

class JoystickWidget extends StatelessWidget with ChildViewMixin<ControlPadViewModel> {
  const JoystickWidget({super.key});

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Joystick(
              mode: JoystickMode.vertical,
              base: FittedBox(
                fit: BoxFit.contain,
                child: Assets.verticalArrow.image(
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
                final int yValue = (details.y * -1 * 50).toInt();
                viewModel.onSpeedChanged(yValue);
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
              base: FittedBox(
                fit: BoxFit.contain,
                child: Assets.horizontalArrow.image(
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
                final int xValue = (details.x * 30).toInt();
                viewModel.onDirectionChanged(xValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
