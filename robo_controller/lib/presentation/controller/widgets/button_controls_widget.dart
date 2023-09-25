import 'package:flutter/material.dart';
import 'package:robo_controller/core/presentation/views/child_view_mixin.dart';
import 'package:robo_controller/core/presentation/widgets/spaced_column.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

class ButtonControlsWidget extends StatelessWidget with ChildViewMixin<ControlPadViewModel> {
  const ButtonControlsWidget({super.key});

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: SpacedColumn(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTapUp: (_) => viewModel.onSpeedChanged(0),
                  onTapDown: (_) => viewModel.onSpeedChanged(10),
                  onLongPress: () => viewModel.onSpeedChanged(10),
                  onLongPressEnd: (_) => viewModel.onSpeedChanged(0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow.shade900,
                    ),
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
                GestureDetector(
                  onTapUp: (_) => viewModel.onSpeedChanged(0),
                  onTapDown: (_) => viewModel.onSpeedChanged(-10),
                  onLongPress: () => viewModel.onSpeedChanged(-10),
                  onLongPressEnd: (_) => viewModel.onSpeedChanged(0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow.shade900,
                    ),
                    child: const Icon(Icons.arrow_downward),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: SpacedColumn(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTapUp: (_) => viewModel.onDirectionChanged(0),
                  onTapDown: (_) => viewModel.onDirectionChanged(-20),
                  onLongPress: () => viewModel.onDirectionChanged(-20),
                  onLongPressEnd: (_) => viewModel.onDirectionChanged(0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow.shade900,
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                GestureDetector(
                  onTapUp: (_) => viewModel.onDirectionChanged(0),
                  onTapDown: (_) => viewModel.onDirectionChanged(20),
                  onLongPress: () => viewModel.onDirectionChanged(20),
                  onLongPressEnd: (_) => viewModel.onDirectionChanged(0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow.shade900,
                    ),
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
