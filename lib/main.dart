import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:requests_inspector/requests_inspector.dart';
import 'package:wallpaper_application/common/core_data_source/dio_helper/dio_helper.dart';
import 'package:wallpaper_application/common/routes/routes/routes.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const ProviderScope(
    child: RequestsInspector(enabled: kDebugMode, child: MyApp()),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      routerConfig: ref.read(routerProvider),
    );
  }
}
