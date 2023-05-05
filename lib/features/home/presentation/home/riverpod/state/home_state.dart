import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallpaper_application/features/home/data/models/photo.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) final List<Photo> wallpapers,
    @Default(0) final int page,
    @Default(false) final bool isPaginating,
    @Default(false) final bool isFinishedPaginating,
  }) = _HomeState;
}
