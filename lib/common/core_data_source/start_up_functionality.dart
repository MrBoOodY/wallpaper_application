import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/core_data_source/failure.dart';
import 'package:wallpaper_application/common/core_data_source/sqlite_service.dart';
import 'package:wallpaper_application/common/utils.dart';
import 'package:wallpaper_application/injection/injection.dart';

part 'start_up_functionality.g.dart';

@riverpod
Future<void> startUpFunctionality(StartUpFunctionalityRef ref) async {
  try {
    await Future.wait(<Future<dynamic>>[
      ref.read(sqliteServiceProvider).openDatabaseConnection(),
    ]);
  } catch (e) {
    logger.e(e);
    if (e is Failure) {
      Utils.handleFailures(e);
    } else {
      Utils.showErrorToast(e.toString());
    }
  }
}
