import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/favorite/domain/repositories/favorite_repository.dart';

part 'is_in_fav_use_case.g.dart';

@riverpod
Future<bool> isInFavUseCase(
  IsInFavUseCaseRef ref, {
  required int photoId,
}) {
  return ref.read(favoriteRepositoryProvider).isInFav(
        photoId: photoId,
      );
}
