import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/core_data_source/failure.dart';
import 'package:wallpaper_application/common/utils.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/domain/usecases/search_photos_use_case.dart';

part 'photos_search_provider.g.dart';

@riverpod
class PhotosSearch extends _$PhotosSearch {
  Future<List<Photo>> _searchInCategories(String searchQuery) async {
    if (!state.hasValue) {
      state = const AsyncData([]);
      state = const AsyncLoading();
    }
    final result = await AsyncValue.guard(
        () => ref.read(searchPhotosUseCaseProvider(query: searchQuery).future));
    result.whenOrNull(
      data: (projects) {
        state = AsyncData(projects);
      },
      error: (failure, stackTrace) {
        if (failure is Failure) {
          Utils.handleFailures(failure);
          return state.value!;
        }
        state = AsyncError(failure, StackTrace.current);
      },
    );

    return state.value!;
  }

  @override
  FutureOr<List<Photo>> build({required String searchQuery}) =>
      _searchInCategories(searchQuery);
}
