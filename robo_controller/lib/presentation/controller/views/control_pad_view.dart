// coverage:ignore-file

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:robo_controller/core/presentation/navigation/root_auto_router.gr.dart';
import 'package:robo_controller/core/presentation/views/view_route_mixin.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';
import 'package:robo_controller/presentation/controller/widgets/auto_pilot_widget.dart';
import 'package:robo_controller/presentation/controller/widgets/button_controls_widget.dart';
import 'package:robo_controller/presentation/controller/widgets/gauge_widget.dart';
import 'package:robo_controller/presentation/controller/widgets/top_view_car_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class ControlPadView extends StatelessWidget
    with ViewRouteMixin<ControlPadViewModel> {
  final WebViewController _wvController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.black)
    ..loadRequest(Uri.parse(
        'https://viewer.millicast.com?streamId=2Mb6tU/ephpicar&play=false&volume=false&fullscreen=false&pip=false&cast=false&liveBadge=false&userCount=false&disableSettings=true'));

  ControlPadView({super.key = const Key(ControlPadViewRoute.name)});

  @override
  Widget buildView(BuildContext context, ControlPadViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          WebViewWidget(controller: _wvController),

          const GaugeWidget(),
          const TopViewCarWidget(),
          const ButtonControlsWidget(),
        ],
      ),
    );
  }
}
