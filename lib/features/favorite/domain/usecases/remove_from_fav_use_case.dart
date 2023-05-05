import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/favorite/domain/repositories/favorite_repository.dart';

part 'remove_from_fav_use_case.g.dart';

@riverpod
Future<void> removeFromFavUseCase(
  RemoveFromFavUseCaseRef ref, {
  required int photoId,
}) {
  return ref.read(favoriteRepositoryProvider).removeFromFav(
        photoId: photoId,
      );
}
