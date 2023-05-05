import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/constants/urls.dart';
import 'package:wallpaper_application/common/core_data_source/dio_helper/dio_helper.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'home_remote_data_source.g.dart';

@riverpod
HomeRemoteDataSource homeRemoteDataSource(HomeRemoteDataSourceRef ref) {
  return HomeRemoteDataSourceImpl(dio: ref.read(dioHelperProvider));
}

abstract class HomeRemoteDataSource {
  Future<List<Photo>> getPhotos({int? page, int? perPage});
  Future<List<Photo>> searchPhotos(
      {required String query, int? page = 1, int? perPage = 20});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioHelper dio;
  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Photo>> getPhotos({int? page, int? perPage}) async {
    try {
      final response = await dio.doGetRequest(url: Urls.curated, queryParams: {
        'per_page': perPage ?? 20,
        'page': page ?? 1,
      });
      final List<Photo> listData = [];
      for (var data in response['photos']) {
        listData.add(Photo.fromJson(data));
      }
      return listData;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Photo>> searchPhotos(
      {required String query, int? page = 1, int? perPage = 20}) async {
    try {
      final response = await dio.doGetRequest(url: Urls.search, queryParams: {
        'query': query,
        'per_page': perPage,
        'page': page,
      });
      final List<Photo> listData = [];
      for (var data in response['photos']) {
        listData.add(Photo.fromJson(data));
      }
      return listData;
    } catch (error) {
      rethrow;
    }
  }
}
