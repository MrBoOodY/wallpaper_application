import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'add_to_fav_use_case.g.dart';

@riverpod
Future<void> addToFavUseCase(
  AddToFavUseCaseRef ref, {
  required Photo photo,
}) async {
  return await ref.read(favoriteRepositoryProvider).addToFav(photo: photo);
}
