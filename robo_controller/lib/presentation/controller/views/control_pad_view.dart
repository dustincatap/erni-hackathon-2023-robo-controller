// coverage:ignore-file

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:robo_controller/core/presentation/navigation/root_auto_router.gr.dart';
import 'package:robo_controller/core/presentation/views/view_route_mixin.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';
import 'package:robo_controller/presentation/controller/widgets/gauge_widget.dart';
import 'package:robo_controller/presentation/controller/widgets/joystick_widget.dart';
import 'package:robo_controller/presentation/controller/widgets/top_view_car_widget.dart';

@RoutePage()
class ControlPadView extends StatelessWidget with ViewRouteMixin<ControlPadViewModel> {
  const ControlPadView({super.key = const Key(ControlPadViewRoute.name)});

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          GaugeWidget(),
          TopViewCarWidget(),
          JoystickWidget(),
        ],
      ),
    );
  }
}
