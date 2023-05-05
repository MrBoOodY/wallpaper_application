import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/core_data_source/failure.dart';
import 'package:wallpaper_application/common/utils.dart';
import 'package:wallpaper_application/features/favorite/domain/usecases/add_to_fav_use_case.dart';
import 'package:wallpaper_application/features/favorite/domain/usecases/is_in_fav_use_case.dart';
import 'package:wallpaper_application/features/favorite/domain/usecases/remove_from_fav_use_case.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/domain/usecases/download_photo_use_case.dart';
import 'package:wallpaper_application/features/home/domain/usecases/get_photo_use_case.dart';
import 'package:wallpaper_application/features/home/presentation/photo_details/riverpod/state/photo_details_state.dart';

part 'photo_details_provider.g.dart';

@riverpod
class PhotoDetails extends _$PhotoDetails {
  @override
  FutureOr<PhotoDetailsState> build({required int photoId}) =>
      _getPhoto(photoId);
  Future<void> downloadPhoto() async {
    Utils.showLoading();

    final result = await AsyncValue.guard(() => ref.read(
        downloadPhotoUseCaseProvider(url: state.value!.photo.src!.original)
            .future));
    Utils.hideLoading();
    if (result.hasError) {
      if (result.error is Failure) {
        Utils.handleFailures(result.error as Failure);
      } else {
        Utils.showErrorToast(result.error.toString());
      }
    } else {
      Utils.showToast('Downloaded Successfully');
    }
  }

  toggleFavorite() async {
    late final AsyncValue<void> result;
    Utils.showLoading();
    if (state.value!.isInFav) {
      result = await AsyncValue.guard(() => ref.read(
          removeFromFavUseCaseProvider(photoId: state.value!.photo.id!)
              .future));
    } else {
      result = await AsyncValue.guard(() =>
          ref.read(addToFavUseCaseProvider(photo: state.value!.photo).future));
    }
    Utils.hideLoading();
    if (result.hasError) {
      if (result.error is Failure) {
        Utils.handleFailures(result.error as Failure);
      } else {
        Utils.showErrorToast(result.error.toString());
      }
    } else {
      if (state.value!.isInFav) {
        Utils.showToast('Removed Successfully From Favorites');
      } else {
        Utils.showToast('Added Successfully To Favorites');
      }
      state = AsyncData(state.value!.copyWith(isInFav: !state.value!.isInFav));
    }
  }

  Future<PhotoDetailsState> _getPhoto(int photoId) async {
    state = AsyncData(PhotoDetailsState(photo: const Photo()));
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
        () => ref.read(getPhotoUseCaseProvider(photoId: photoId).future));
    final isInFavResult = await AsyncValue.guard(
        () => ref.read(isInFavUseCaseProvider(photoId: photoId).future));

    if (isInFavResult.hasError) {
      if (isInFavResult.error is Failure) {
        Utils.handleFailures(isInFavResult.error as Failure);
      } else {
        Utils.showErrorToast(isInFavResult.error.toString());
      }
      return PhotoDetailsState(photo: const Photo());
    }
    if (result.hasError) {
      if (result.error is Failure) {
        Utils.handleFailures(result.error as Failure);
      } else {
        Utils.showErrorToast(result.error.toString());
      }
      return PhotoDetailsState(
          photo: const Photo(), isInFav: isInFavResult.value!);
    }
    return PhotoDetailsState(
        photo: result.value!, isInFav: isInFavResult.value!);
  }
}
