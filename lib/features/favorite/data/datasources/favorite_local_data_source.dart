import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/core_data_source/exception.dart';
import 'package:wallpaper_application/common/core_data_source/sqlite_service.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'favorite_local_data_source.g.dart';

@riverpod
FavoriteLocalDataSource favoriteLocalDataSource(
        FavoriteLocalDataSourceRef ref) =>
    FavoriteLocalDataSourceImpl(sqliteService: ref.read(sqliteServiceProvider));

abstract class FavoriteLocalDataSource {
  Future<void> addToFav({required Photo photo});
  Future<void> removeFromFav({required int photoId});
  Future<bool> isInFav({required int photoId});
  Future<List<Photo>> getAllPhotos({int? page, int? perPage});
}

class FavoriteLocalDataSourceImpl
    with DataSourceSQFLiteOperation<Photo>
    implements FavoriteLocalDataSource {
  @override
  final SQLiteService sqliteService;
  @override
  String get tableName => SQLiteServiceKeys.photosTable;
  @override
  Map<String, dynamic> Function(Photo photo) get toJson =>
      (photo) => photo.toSQFLiteMap();

  @override
  Photo Function(Map<String, dynamic> json) get fromJson =>
      Photo.fromSQFLiteMap;
  FavoriteLocalDataSourceImpl({required this.sqliteService});

  @override
  Future<void> addToFav({required Photo photo}) async {
    try {
      await super.add(model: photo);
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<void> removeFromFav({required int photoId}) async {
    try {
      await super.delete(id: photoId);
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<bool> isInFav({required int photoId}) async {
    try {
      final result = await super.getById(id: photoId);

      return result != null;
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<List<Photo>> getAllPhotos({int? page, int? perPage}) async {
    try {
      return await super.getAll(page: page ?? 1, pageSize: perPage ?? 20);
    } catch (e) {
      throw DatabaseException();
    }
  }
}
