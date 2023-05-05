import 'package:wallpaper_application/features/favorite/data/datasources/favorite_local_data_source.dart';
import 'package:wallpaper_application/features/favorite/domain/repositories/favorite_repository.dart';

import '../../../../common/core_data_source/helpers.dart';
import '../../../home/data/models/photo.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;
  FavoriteRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<void> addToFav({required Photo photo}) {
    return FailureHelper<void>().execute(() async {
      final result = await localDataSource.addToFav(
        photo: photo,
      );
      return result;
    });
  }

  @override
  Future<void> removeFromFav({required int photoId}) {
    return FailureHelper<void>().execute(
      () async {
        final result = await localDataSource.removeFromFav(photoId: photoId);
        return result;
      },
    );
  }

  @override
  Future<bool> isInFav({required int photoId}) {
    return FailureHelper<bool>().execute(
      () async {
        final result = await localDataSource.isInFav(photoId: photoId);
        return result;
      },
    );
  }

  @override
  Future<List<Photo>> getAllPhotos({int? page, int? perPage}) {
    return FailureHelper<List<Photo>>().execute(() async {
      final result =
          await localDataSource.getAllPhotos(page: page, perPage: perPage);
      return result;
    });
  }
}
