import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/core_data_source/network_info.dart';
import 'package:wallpaper_application/features/home/data/datasources/home_remote_data_source.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/data/repositories/home_repository_impl.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepositoryImpl(
      networkInfo: ref.read(networkInfoProvider),
      remoteDataSource: ref.read(homeRemoteDataSourceProvider));
}

abstract class HomeRepository {
  Future<List<Photo>> getPhotos({int? page, int? perPage});
  Future<Photo> getPhoto({required int id});

  Future<List<Photo>> searchPhotos(
      {required String query, int? page = 1, int? perPage = 20});
  Future<void> downloadPhoto({required String url});
}
