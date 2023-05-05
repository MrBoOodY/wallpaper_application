import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'photo_details_state.freezed.dart';

@freezed
abstract class PhotoDetailsState with _$PhotoDetailsState {
  factory PhotoDetailsState({
    required final Photo photo,
    @Default(false) final bool isInFav,
  }) = _PhotoDetailsState;
}
