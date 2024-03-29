// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<Photo> get wallpapers => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isPaginating => throw _privateConstructorUsedError;
  bool get isFinishedPaginating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<Photo> wallpapers,
      int page,
      bool isPaginating,
      bool isFinishedPaginating});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallpapers = null,
    Object? page = null,
    Object? isPaginating = null,
    Object? isFinishedPaginating = null,
  }) {
    return _then(_value.copyWith(
      wallpapers: null == wallpapers
          ? _value.wallpapers
          : wallpapers // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginating: null == isPaginating
          ? _value.isPaginating
          : isPaginating // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinishedPaginating: null == isFinishedPaginating
          ? _value.isFinishedPaginating
          : isFinishedPaginating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Photo> wallpapers,
      int page,
      bool isPaginating,
      bool isFinishedPaginating});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallpapers = null,
    Object? page = null,
    Object? isPaginating = null,
    Object? isFinishedPaginating = null,
  }) {
    return _then(_$_HomeState(
      wallpapers: null == wallpapers
          ? _value._wallpapers
          : wallpapers // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginating: null == isPaginating
          ? _value.isPaginating
          : isPaginating // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinishedPaginating: null == isFinishedPaginating
          ? _value.isFinishedPaginating
          : isFinishedPaginating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {final List<Photo> wallpapers = const [],
      this.page = 0,
      this.isPaginating = false,
      this.isFinishedPaginating = false})
      : _wallpapers = wallpapers;

  final List<Photo> _wallpapers;
  @override
  @JsonKey()
  List<Photo> get wallpapers {
    if (_wallpapers is EqualUnmodifiableListView) return _wallpapers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallpapers);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool isPaginating;
  @override
  @JsonKey()
  final bool isFinishedPaginating;

  @override
  String toString() {
    return 'HomeState(wallpapers: $wallpapers, page: $page, isPaginating: $isPaginating, isFinishedPaginating: $isFinishedPaginating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other._wallpapers, _wallpapers) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isPaginating, isPaginating) ||
                other.isPaginating == isPaginating) &&
            (identical(other.isFinishedPaginating, isFinishedPaginating) ||
                other.isFinishedPaginating == isFinishedPaginating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wallpapers),
      page,
      isPaginating,
      isFinishedPaginating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final List<Photo> wallpapers,
      final int page,
      final bool isPaginating,
      final bool isFinishedPaginating}) = _$_HomeState;

  @override
  List<Photo> get wallpapers;
  @override
  int get page;
  @override
  bool get isPaginating;
  @override
  bool get isFinishedPaginating;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
