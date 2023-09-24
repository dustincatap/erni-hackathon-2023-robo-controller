import 'package:flutter/material.dart';
import 'package:robo_controller/common/resources/assets.gen.dart';
import 'package:robo_controller/core/presentation/views/child_view_mixin.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

class TopViewCarWidget extends StatelessWidget with ChildViewMixin<ControlPadViewModel> {
  const TopViewCarWidget({super.key});

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: ValueListenableBuilder<int>(
          valueListenable: viewModel.direction,
          builder: (BuildContext context, int direction, Widget? child) {
            return Transform.rotate(
              // degrees to radians
              angle: direction * 0.0174533,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Assets.topViewCar.image(
                  width: 100,
                  height: 100,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
