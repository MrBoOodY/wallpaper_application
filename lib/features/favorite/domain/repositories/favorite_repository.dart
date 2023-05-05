import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/favorite/data/datasources/favorite_local_data_source.dart';
import 'package:wallpaper_application/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'favorite_repository.g.dart';

@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) =>
    FavoriteRepositoryImpl(
      localDataSource: ref.read(favoriteLocalDataSourceProvider),
    );

abstract class FavoriteRepository {
  Future<void> addToFav({required Photo photo});
  Future<void> removeFromFav({required int photoId});
  Future<bool> isInFav({required int photoId});
}
