import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/injection/injection.dart';

part 'network_info.g.dart';

@riverpod
NetworkInfo networkInfo(NetworkInfoRef ref) => NetworkInfoImpl(
      internetConnectionChecker: ref.read(internetConnectionCheckerProvider),
    );

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionCheckerPlus internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
