// coverage:ignore-file

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/presentation/navigation/root_auto_router.gr.dart';

abstract interface class RootAutoRouter implements StackRouter {
  RouteInformationParser<Object> get routeInformationParser;
}

@LazySingleton(as: RootAutoRouter)
@AutoRouterConfig(replaceInRouteName: 'View,ViewRoute')
class RootAutoRouterImpl extends $RootAutoRouterImpl implements RootAutoRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes {
    return <AutoRoute>[
      AutoRoute(page: ControlPadViewRoute.page, path: '/'),
    ];
  }

  @override
  RouteInformationParser<Object> get routeInformationParser => root.defaultRouteParser();
}
