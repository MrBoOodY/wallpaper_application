import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/core_data_source/failure.dart';
import 'package:wallpaper_application/common/utils.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';
import 'package:wallpaper_application/features/home/domain/usecases/get_photo_use_case.dart';

part 'photo_details_provider.g.dart';

@riverpod
class PhotoDetails extends _$PhotoDetails {
  @override
  FutureOr<Photo> build({required int photoId}) => _getPhoto(photoId);

  Future<Photo> _getPhoto(int photoId) async {
    state = await AsyncValue.guard(
        () => ref.read(getPhotoUseCaseProvider(photoId: photoId).future));

    if (state.hasError) {
      if (state.error is Failure) {
        Utils.handleFailures(state.error as Failure);
      } else {
        Utils.showErrorToast(state.error.toString());
      }
      return const Photo();
    }
    return state.value!;
  }
}
