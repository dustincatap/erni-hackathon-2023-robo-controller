import 'package:injectable/injectable.dart';

abstract interface class EnvironmentVariables {
  String get appEnvironment;

  String get appServerUrl;

  String get mobileWebSocketUrl;
}

@LazySingleton(as: EnvironmentVariables)
class EnvironmentVariablesImpl implements EnvironmentVariables {
  const EnvironmentVariablesImpl();

  @override
  String get appEnvironment => const String.fromEnvironment('appEnvironment');

  @override
  String get appServerUrl => const String.fromEnvironment('appServerUrl');

  @override
  String get mobileWebSocketUrl => const String.fromEnvironment('mobileWebSocketUrl');
}
