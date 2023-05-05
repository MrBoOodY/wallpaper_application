import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/domain/repositories/home_repository.dart';

part 'search_photos_use_case.g.dart';

@riverpod
Future<List<Photo>> searchPhotosUseCase(
  SearchPhotosUseCaseRef ref, {
  int? page,
  int? perPage,
  required String query,
}) {
  return ref.read(homeRepositoryProvider).searchPhotos(
        query: query,
        page: page,
        perPage: perPage,
      );
}
