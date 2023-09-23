// coverage:ignore-file

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:robo_controller/common/localization/generated/l10n.dart';
import 'package:robo_controller/core/infrastructure/logging/logger.dart';
import 'package:robo_controller/core/service_locator.dart';
import 'package:robo_controller/main.reflectable.dart';
import 'package:robo_controller/presentation/app/views/app.dart';

Future<void> main() async {
  initializeReflectable();
  ServiceLocator.registerDependencies();

  final Logger zoneLogger = ServiceLocator.instance<Logger>();
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Il8n.load(const Locale('en'));
      runApp(const App());
    },
    (Object ex, StackTrace st) => zoneLogger.log(LogLevel.error, 'Unhandled error', ex, st),
  );
}
