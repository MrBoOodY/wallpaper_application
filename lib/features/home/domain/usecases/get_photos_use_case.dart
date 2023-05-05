import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/domain/repositories/home_repository.dart';

part 'get_photos_use_case.g.dart';

@riverpod
Future<List<Photo>> getPhotosUseCase(GetPhotosUseCaseRef ref,
    {int? page, int? perPage}) {
  return ref.read(homeRepositoryProvider).getPhotos(
        page: page,
        perPage: perPage,
      );
}
