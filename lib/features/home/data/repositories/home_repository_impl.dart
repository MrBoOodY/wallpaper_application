import 'package:wallpaper_application/common/core_data_source/helpers.dart';
import 'package:wallpaper_application/common/core_data_source/network_info.dart';
import 'package:wallpaper_application/features/home/data/datasources/home_remote_data_source.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Photo>> getPhotos({int? page, int? perPage}) {
    return FailureHelper<List<Photo>>().execute(() async {
      final result =
          await remoteDataSource.getPhotos(page: page, perPage: perPage);
      return result;
    }, networkInfo: networkInfo);
  }

  @override
  Future<List<Photo>> searchPhotos(
      {required String query, int? page = 1, int? perPage = 20}) {
    return FailureHelper<List<Photo>>().execute(() async {
      final result = await remoteDataSource.searchPhotos(
          query: query, page: page, perPage: perPage);
      return result;
    }, networkInfo: networkInfo);
  }
}
