// coverage:ignore-file

import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/infrastructure/environment/environment_variables.dart';
import 'package:robo_controller/core/service_locator.dart';

@module
abstract class EnvironmentModule {
  const EnvironmentModule();

  @lazySingleton
  @appServerUrl
  String getAppServerUrl(EnvironmentVariables environmentVariables) => environmentVariables.appServerUrl;
}
