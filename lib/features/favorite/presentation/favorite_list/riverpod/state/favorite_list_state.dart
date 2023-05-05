import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'favorite_list_state.freezed.dart';

@freezed
abstract class FavoriteListState with _$FavoriteListState {
  factory FavoriteListState({
    @Default([]) final List<Photo> wallpapers,
    @Default(0) final int page,
    @Default(false) final bool isPaginating,
    @Default(false) final bool isFinishedPaginating,
  }) = _FavoriteListState;
}
