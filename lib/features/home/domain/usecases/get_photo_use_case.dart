import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/domain/repositories/home_repository.dart';

part 'get_photo_use_case.g.dart';

@riverpod
Future<Photo> getPhotoUseCase(
  GetPhotoUseCaseRef ref, {
  required int photoId,
}) {
  return ref.read(homeRepositoryProvider).getPhoto(
        id: photoId,
      );
}
