// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getImages value) getImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getImages value)? getImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getImages value)? getImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_getImagesCopyWith<$Res> {
  factory _$$_getImagesCopyWith(
          _$_getImages value, $Res Function(_$_getImages) then) =
      __$$_getImagesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_getImagesCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$_getImages>
    implements _$$_getImagesCopyWith<$Res> {
  __$$_getImagesCopyWithImpl(
      _$_getImages _value, $Res Function(_$_getImages) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_getImages implements _getImages {
  const _$_getImages();

  @override
  String toString() {
    return 'HomeEvent.getImages()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_getImages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getImages,
  }) {
    return getImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getImages,
  }) {
    return getImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getImages,
    required TResult orElse(),
  }) {
    if (getImages != null) {
      return getImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getImages value) getImages,
  }) {
    return getImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getImages value)? getImages,
  }) {
    return getImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getImages value)? getImages,
    required TResult orElse(),
  }) {
    if (getImages != null) {
      return getImages(this);
    }
    return orElse();
  }
}

abstract class _getImages implements HomeEvent {
  const factory _getImages() = _$_getImages;
}

/// @nodoc
mixin _$Homestate {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<HotAndNewData> get tvDramas => throw _privateConstructorUsedError;
  List<HotAndNewData> get top10 => throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingNow => throw _privateConstructorUsedError;
  List<HotAndNewData> get dramas => throw _privateConstructorUsedError;
  List<HotAndNewData> get tvShows => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomestateCopyWith<Homestate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomestateCopyWith<$Res> {
  factory $HomestateCopyWith(Homestate value, $Res Function(Homestate) then) =
      _$HomestateCopyWithImpl<$Res, Homestate>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<HotAndNewData> tvDramas,
      List<HotAndNewData> top10,
      List<HotAndNewData> trendingNow,
      List<HotAndNewData> dramas,
      List<HotAndNewData> tvShows});
}

/// @nodoc
class _$HomestateCopyWithImpl<$Res, $Val extends Homestate>
    implements $HomestateCopyWith<$Res> {
  _$HomestateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? tvDramas = null,
    Object? top10 = null,
    Object? trendingNow = null,
    Object? dramas = null,
    Object? tvShows = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      tvDramas: null == tvDramas
          ? _value.tvDramas
          : tvDramas // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      top10: null == top10
          ? _value.top10
          : top10 // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingNow: null == trendingNow
          ? _value.trendingNow
          : trendingNow // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      dramas: null == dramas
          ? _value.dramas
          : dramas // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tvShows: null == tvShows
          ? _value.tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomestateCopyWith<$Res> implements $HomestateCopyWith<$Res> {
  factory _$$_HomestateCopyWith(
          _$_Homestate value, $Res Function(_$_Homestate) then) =
      __$$_HomestateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<HotAndNewData> tvDramas,
      List<HotAndNewData> top10,
      List<HotAndNewData> trendingNow,
      List<HotAndNewData> dramas,
      List<HotAndNewData> tvShows});
}

/// @nodoc
class __$$_HomestateCopyWithImpl<$Res>
    extends _$HomestateCopyWithImpl<$Res, _$_Homestate>
    implements _$$_HomestateCopyWith<$Res> {
  __$$_HomestateCopyWithImpl(
      _$_Homestate _value, $Res Function(_$_Homestate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? tvDramas = null,
    Object? top10 = null,
    Object? trendingNow = null,
    Object? dramas = null,
    Object? tvShows = null,
  }) {
    return _then(_$_Homestate(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      tvDramas: null == tvDramas
          ? _value._tvDramas
          : tvDramas // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      top10: null == top10
          ? _value._top10
          : top10 // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingNow: null == trendingNow
          ? _value._trendingNow
          : trendingNow // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      dramas: null == dramas
          ? _value._dramas
          : dramas // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tvShows: null == tvShows
          ? _value._tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
    ));
  }
}

/// @nodoc

class _$_Homestate implements _Homestate {
  const _$_Homestate(
      {required this.isLoading,
      required this.hasError,
      required final List<HotAndNewData> tvDramas,
      required final List<HotAndNewData> top10,
      required final List<HotAndNewData> trendingNow,
      required final List<HotAndNewData> dramas,
      required final List<HotAndNewData> tvShows})
      : _tvDramas = tvDramas,
        _top10 = top10,
        _trendingNow = trendingNow,
        _dramas = dramas,
        _tvShows = tvShows;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  final List<HotAndNewData> _tvDramas;
  @override
  List<HotAndNewData> get tvDramas {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tvDramas);
  }

  final List<HotAndNewData> _top10;
  @override
  List<HotAndNewData> get top10 {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top10);
  }

  final List<HotAndNewData> _trendingNow;
  @override
  List<HotAndNewData> get trendingNow {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingNow);
  }

  final List<HotAndNewData> _dramas;
  @override
  List<HotAndNewData> get dramas {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dramas);
  }

  final List<HotAndNewData> _tvShows;
  @override
  List<HotAndNewData> get tvShows {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tvShows);
  }

  @override
  String toString() {
    return 'Homestate(isLoading: $isLoading, hasError: $hasError, tvDramas: $tvDramas, top10: $top10, trendingNow: $trendingNow, dramas: $dramas, tvShows: $tvShows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Homestate &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality().equals(other._tvDramas, _tvDramas) &&
            const DeepCollectionEquality().equals(other._top10, _top10) &&
            const DeepCollectionEquality()
                .equals(other._trendingNow, _trendingNow) &&
            const DeepCollectionEquality().equals(other._dramas, _dramas) &&
            const DeepCollectionEquality().equals(other._tvShows, _tvShows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      const DeepCollectionEquality().hash(_tvDramas),
      const DeepCollectionEquality().hash(_top10),
      const DeepCollectionEquality().hash(_trendingNow),
      const DeepCollectionEquality().hash(_dramas),
      const DeepCollectionEquality().hash(_tvShows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomestateCopyWith<_$_Homestate> get copyWith =>
      __$$_HomestateCopyWithImpl<_$_Homestate>(this, _$identity);
}

abstract class _Homestate implements Homestate {
  const factory _Homestate(
      {required final bool isLoading,
      required final bool hasError,
      required final List<HotAndNewData> tvDramas,
      required final List<HotAndNewData> top10,
      required final List<HotAndNewData> trendingNow,
      required final List<HotAndNewData> dramas,
      required final List<HotAndNewData> tvShows}) = _$_Homestate;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  List<HotAndNewData> get tvDramas;
  @override
  List<HotAndNewData> get top10;
  @override
  List<HotAndNewData> get trendingNow;
  @override
  List<HotAndNewData> get dramas;
  @override
  List<HotAndNewData> get tvShows;
  @override
  @JsonKey(ignore: true)
  _$$_HomestateCopyWith<_$_Homestate> get copyWith =>
      throw _privateConstructorUsedError;
}
