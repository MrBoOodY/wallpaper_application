import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'get_favorite_photos_use_case.g.dart';

@riverpod
Future<List<Photo>> getFavoritePhotosUseCase(
  GetFavoritePhotosUseCaseRef ref, {
  int? page,
  int? perPage,
}) {
  return ref.read(favoriteRepositoryProvider).getAllPhotos(
        page: page,
        perPage: perPage,
      );
}
