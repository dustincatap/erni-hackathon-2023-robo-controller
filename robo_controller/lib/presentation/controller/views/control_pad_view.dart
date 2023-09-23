// coverage:ignore-file

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robo_controller/core/presentation/navigation/root_auto_router.gr.dart';
import 'package:robo_controller/core/presentation/views/view_route_mixin.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

@RoutePage()
class ControlPadView extends StatelessWidget with ViewRouteMixin<ControlPadViewModel> {
  const ControlPadView() : super(key: const Key(ControlPadViewRoute.name));

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Pad'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Joystick(
                mode: JoystickMode.vertical,
                base: Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                stick: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                listener: (StickDragDetails details) {
                  viewModel.onHorizontalChanged(details.y);
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
                base: Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                stick: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                listener: (StickDragDetails details) {
                  viewModel.onVerticalChanged(details.x);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
