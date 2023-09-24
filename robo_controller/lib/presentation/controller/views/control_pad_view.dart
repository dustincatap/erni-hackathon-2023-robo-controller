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
class ControlPadView extends StatefulWidget {
  const ControlPadView({super.key = const Key(ControlPadViewRoute.name)});

  @override
  State<ControlPadView> createState() => _ControlPadViewState();
}

class _ControlPadViewState extends State<ControlPadView> with ViewRouteMixin<ControlPadViewModel> {
  double speed = 0.0;
  double angle = 0.0;

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          GaugeWidget(value: speed),
          TopViewCarWidget(value: angle),
          JoystickWidget(
            viewModel: viewModel,
            onHorizontalChanged: _handleOnHorizontalChanged,
            onVerticalChanged: _handleOnVerticalChanged,
          ),
        ],
      ),
    );
  }

  void _handleOnHorizontalChanged(double value) {
    setState(() {
      speed = value * 200;
    });
  }

  void _handleOnVerticalChanged(double value) {
    setState(() {
      angle = (value / 100) * 45;
    });
  }
}
