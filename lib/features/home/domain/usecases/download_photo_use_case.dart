import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/home/domain/repositories/home_repository.dart';

part 'download_photo_use_case.g.dart';

@riverpod
Future<void> downloadPhotoUseCase(
  DownloadPhotoUseCaseRef ref, {
  required String url,
}) {
  return ref.read(homeRepositoryProvider).downloadPhoto(
        url: url,
      );
}
