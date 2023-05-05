import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'injection.g.dart';

// external
final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

@riverpod
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) =>
    const FlutterSecureStorage();
@riverpod
InternetConnectionCheckerPlus internetConnectionChecker(
        InternetConnectionCheckerRef ref) =>
    InternetConnectionCheckerPlus();

//end external
 