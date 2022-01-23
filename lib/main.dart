import 'dart:io';

import 'package:flutter/material.dart';

import 'core/app_main.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';

String dev = '.env.dev';
String homol = '.env.homol';
String prod = '.env.prod';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // Run app!
  HttpOverrides.global = MyHttpOverrides();
  Paint.enableDithering = true;
  // initializeDateFormatting('pt_BR', null);
  // Intl.defaultLocale = 'pt_BR';
  // await DotEnv().load(prod);

  await runBaseApp();
}
