import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/core_data_source/failure.dart';
import 'package:wallpaper_application/common/utils.dart';
import 'package:wallpaper_application/features/favorite/domain/usecases/get_favorite_photos_use_case.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/presentation/home/riverpod/state/home_state.dart';

part 'favorite_list_provider.g.dart';

@riverpod
class FavoriteList extends _$FavoriteList {
  Future<HomeState> getPhotos({bool isPaginating = false}) async {
    if (state.value!.isFinishedPaginating || state.value!.isPaginating) {
      return state.value!;
    }
    if (isPaginating) {
      state = AsyncData(state.value!.copyWith(isPaginating: isPaginating));
    }
    state = AsyncData(state.value!.copyWith(page: state.value!.page + 1));
    final result =
        await AsyncValue.guard(() => ref.read(getFavoritePhotosUseCaseProvider(
              page: state.value!.page,
            ).future));

    if (isPaginating) {
      state = AsyncData(state.value!.copyWith(isPaginating: false));
    }
    if (result.hasError) {
      if (result.error is Failure) {
        Utils.handleFailures(result.error as Failure);
      } else {
        Utils.showToast(result.error.toString());
      }
      return state.value!;
    }

    if (result.value!.isEmpty) {
      state = AsyncData(state.value!.copyWith(isFinishedPaginating: true));
    } else if (state.value!.wallpapers.isEmpty) {
      state = AsyncData(state.value!.copyWith(wallpapers: result.value!));
    } else if (result.value!.isNotEmpty) {
      final newRequestsFromNetwork = result.value!;

      final addNewListToOldRequests = List<Photo>.from(state.value!.wallpapers)
        ..addAll(newRequestsFromNetwork);

      final homeStateCopyWith = state.value!.copyWith(
        wallpapers: addNewListToOldRequests,
      );

      state = AsyncData(homeStateCopyWith);
    }

    return state.value!;
  }

  @override
  FutureOr<HomeState> build() {
    state = AsyncData(HomeState());
    state = const AsyncLoading();

    return getPhotos();
  }
}
