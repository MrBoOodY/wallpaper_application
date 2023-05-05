import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_local_data_source.g.dart';

@riverpod
FavoriteLocalDataSource favoriteLocalDataSource(
        FavoriteLocalDataSourceRef ref) =>
    FavoriteLocalDataSourceImpl();

abstract class FavoriteLocalDataSource {
  Future<bool> toggleLike({required int adId});
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  FavoriteLocalDataSourceImpl();

  @override
  Future<bool> toggleLike({required int adId}) async {
    try {
      //TODO implement like in sqflite
      throw UnimplementedError();
    } catch (error) {
      rethrow;
    }
  }
}
