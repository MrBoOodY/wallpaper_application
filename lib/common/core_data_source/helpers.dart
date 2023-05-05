import 'dart:io';

import 'package:wallpaper_application/common/core_data_source/exception.dart';
import 'package:wallpaper_application/common/core_data_source/failure.dart';
import 'package:wallpaper_application/common/core_data_source/network_info.dart';

class FailureHelper<T> {
  Future<T> execute(Future<T> Function() function,
      {Function(dynamic)? onError, NetworkInfo? networkInfo}) async {
    if (networkInfo != null && !await networkInfo.isConnected) {
      throw const ConnectionFailure();
    }
    try {
      return await function();
    } on ServerException catch (exc) {
      throw ServerFailure(message: exc.message);
    } on DatabaseFailure catch (exc) {
      throw DatabaseFailure(message: exc.message);
    } on SocketException {
      throw const ConnectionFailure();
    } catch (error) {
      throw const ExceptionFailure();
    }
  }
}
