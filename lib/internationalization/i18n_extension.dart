import 'package:flutter/material.dart';

import 'appLocalizations.dart';

extension I18ndExtension on String {
  String i18n(BuildContext context, [Map<String, String>? args]) {
    return AppLocalizations.of(context)!.translate(this) ?? '';
  }
}
