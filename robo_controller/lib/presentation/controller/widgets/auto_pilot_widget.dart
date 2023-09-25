import 'package:flutter/material.dart';
import 'package:robo_controller/core/presentation/views/child_view_mixin.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

class AutoPilotWidget extends StatelessWidget with ChildViewMixin<ControlPadViewModel> {
  const AutoPilotWidget({super.key});

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: ValueListenableBuilder<bool>(
            valueListenable: viewModel.isAutoPilot,
            builder: (BuildContext context, bool isAutoPilot, Widget? child) {
              return ElevatedButton(
                onPressed: () {
                  viewModel.onAutoPilotChanged(value: !isAutoPilot);
                },
                style: ElevatedButton.styleFrom(backgroundColor: isAutoPilot ? Colors.white : Colors.orange),
                child: const Text(
                  'Auto Pilot',
                  style: TextStyle(color: Colors.black),
                ),
              );
            }),
      ),
    );
  }
}
