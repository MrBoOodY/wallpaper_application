import 'package:wallpaper_application/features/favorite/data/datasources/favorite_local_data_source.dart';
import 'package:wallpaper_application/features/favorite/domain/repositories/favorite_repository.dart';

import '../../../../common/core_data_source/helpers.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;
  FavoriteRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<bool> toggleLike({required int adId}) {
    return FailureHelper<bool>().execute(() async {
      final result = await localDataSource.toggleLike(
        adId: adId,
      );
      return result;
    });
  }
}
