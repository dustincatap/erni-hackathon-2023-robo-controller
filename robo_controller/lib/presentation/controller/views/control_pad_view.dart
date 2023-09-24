// coverage:ignore-file

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:pod_player/pod_player.dart';
import 'package:robo_controller/core/presentation/navigation/root_auto_router.gr.dart';
import 'package:robo_controller/core/presentation/views/view_route_mixin.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

@RoutePage()
class ControlPadView extends StatelessWidget with ViewRouteMixin<ControlPadViewModel> {
  final PodPlayerController _ytController = PodPlayerController(
    playVideoFrom: PlayVideoFrom.youtube(
      'https://www.youtube.com/watch?v=kxnnXLPj4zY', // make this configurable
      live: true,
    ),
    podPlayerConfig: const PodPlayerConfig(
      autoPlay: true,
      isLooping: false,
    ),
  )..initialise();

  ControlPadView() : super(key: const Key(ControlPadViewRoute.name));

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Pad'),
      ),
      body: Stack(
        children: <Widget>[
          PodVideoPlayer(controller: _ytController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Padding(
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
                      stick: GestureDetector(
                        onTap: () => viewModel.onSpeedChanged(0),
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      listener: (StickDragDetails details) {
                        final double yValue = details.y;
                        // invert y so that up is positive, down is negative
                        double adjustedYValue = yValue * -1;
                        adjustedYValue = adjustedYValue * 50;

                        viewModel.onSpeedChanged(adjustedYValue.toInt());
                      },
                      onStickDragStart: () => viewModel.onSpeedChanged(0),
                      onStickDragEnd: () => viewModel.onSpeedChanged(0),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
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
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                      listener: (StickDragDetails details) async {
                        final double adjustedXValue = details.x * 30;
                        viewModel.onDirectionChanged(adjustedXValue.toInt());
                      },
                      onStickDragStart: () => viewModel.onDirectionChanged(0),
                      onStickDragEnd: () => viewModel.onDirectionChanged(0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
