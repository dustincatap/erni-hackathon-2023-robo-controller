// ignore_for_file: prefer-static-class

import 'dart:ui';

import 'package:robo_controller/common/localization/generated/l10n.dart';

Future<Il8n> setupLocale([String langCode = 'en']) {
  return Il8n.load(Locale(langCode));
}
