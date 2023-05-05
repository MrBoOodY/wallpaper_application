import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/favorite/data/datasources/favorite_local_data_source.dart';
import 'package:wallpaper_application/features/favorite/data/repositories/favorite_repository_impl.dart';

part 'favorite_repository.g.dart';

@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) =>
    FavoriteRepositoryImpl(
      localDataSource: ref.read(favoriteLocalDataSourceProvider),
    );

abstract class FavoriteRepository {
  /// to toggle Like one ad using its id
  Future<bool> toggleLike({required int adId});
}
