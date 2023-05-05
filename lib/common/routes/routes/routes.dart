import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/routes/route_strings.dart';
import 'package:wallpaper_application/features/home/presentation/home/page/home_page.dart';

final _key = GlobalKey<NavigatorState>();

BuildContext get appContext => _key.currentContext!;
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: _key,
      routes: <GoRoute>[
        GoRoute(
          name: RouteStrings.initial,
          path: RouteStrings.initial,
          redirect: (context, state) {
            return RouteStrings.home;
          },
        ),
        GoRoute(
          name: RouteStrings.home,
          path: RouteStrings.home,
          builder: (context, state) {
            return const HomePage();
          },
        ),
      ],
    );
  },
);
