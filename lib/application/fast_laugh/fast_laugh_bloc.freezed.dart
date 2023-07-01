// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fast_laugh_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FastLaughEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideos,
    required TResult Function(int id) unlikedVieos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideos,
    TResult? Function(int id)? unlikedVieos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideos,
    TResult Function(int id)? unlikedVieos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(likedVideos value) likedVideos,
    required TResult Function(unlikedVieos value) unlikedVieos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(likedVideos value)? likedVideos,
    TResult? Function(unlikedVieos value)? unlikedVieos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(likedVideos value)? likedVideos,
    TResult Function(unlikedVieos value)? unlikedVieos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastLaughEventCopyWith<$Res> {
  factory $FastLaughEventCopyWith(
          FastLaughEvent value, $Res Function(FastLaughEvent) then) =
      _$FastLaughEventCopyWithImpl<$Res, FastLaughEvent>;
}

/// @nodoc
class _$FastLaughEventCopyWithImpl<$Res, $Val extends FastLaughEvent>
    implements $FastLaughEventCopyWith<$Res> {
  _$FastLaughEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeCopyWith<$Res> {
  factory _$$InitializeCopyWith(
          _$Initialize value, $Res Function(_$Initialize) then) =
      __$$InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeCopyWithImpl<$Res>
    extends _$FastLaughEventCopyWithImpl<$Res, _$Initialize>
    implements _$$InitializeCopyWith<$Res> {
  __$$InitializeCopyWithImpl(
      _$Initialize _value, $Res Function(_$Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initialize implements Initialize {
  const _$Initialize();

  @override
  String toString() {
    return 'FastLaughEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideos,
    required TResult Function(int id) unlikedVieos,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideos,
    TResult? Function(int id)? unlikedVieos,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideos,
    TResult Function(int id)? unlikedVieos,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(likedVideos value) likedVideos,
    required TResult Function(unlikedVieos value) unlikedVieos,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(likedVideos value)? likedVideos,
    TResult? Function(unlikedVieos value)? unlikedVieos,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(likedVideos value)? likedVideos,
    TResult Function(unlikedVieos value)? unlikedVieos,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements FastLaughEvent {
  const factory Initialize() = _$Initialize;
}

/// @nodoc
abstract class _$$likedVideosCopyWith<$Res> {
  factory _$$likedVideosCopyWith(
          _$likedVideos value, $Res Function(_$likedVideos) then) =
      __$$likedVideosCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$likedVideosCopyWithImpl<$Res>
    extends _$FastLaughEventCopyWithImpl<$Res, _$likedVideos>
    implements _$$likedVideosCopyWith<$Res> {
  __$$likedVideosCopyWithImpl(
      _$likedVideos _value, $Res Function(_$likedVideos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$likedVideos(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$likedVideos implements likedVideos {
  const _$likedVideos({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FastLaughEvent.likedVideos(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$likedVideos &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$likedVideosCopyWith<_$likedVideos> get copyWith =>
      __$$likedVideosCopyWithImpl<_$likedVideos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideos,
    required TResult Function(int id) unlikedVieos,
  }) {
    return likedVideos(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideos,
    TResult? Function(int id)? unlikedVieos,
  }) {
    return likedVideos?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideos,
    TResult Function(int id)? unlikedVieos,
    required TResult orElse(),
  }) {
    if (likedVideos != null) {
      return likedVideos(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(likedVideos value) likedVideos,
    required TResult Function(unlikedVieos value) unlikedVieos,
  }) {
    return likedVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(likedVideos value)? likedVideos,
    TResult? Function(unlikedVieos value)? unlikedVieos,
  }) {
    return likedVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(likedVideos value)? likedVideos,
    TResult Function(unlikedVieos value)? unlikedVieos,
    required TResult orElse(),
  }) {
    if (likedVideos != null) {
      return likedVideos(this);
    }
    return orElse();
  }
}

abstract class likedVideos implements FastLaughEvent {
  const factory likedVideos({required final int id}) = _$likedVideos;

  int get id;
  @JsonKey(ignore: true)
  _$$likedVideosCopyWith<_$likedVideos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$unlikedVieosCopyWith<$Res> {
  factory _$$unlikedVieosCopyWith(
          _$unlikedVieos value, $Res Function(_$unlikedVieos) then) =
      __$$unlikedVieosCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$unlikedVieosCopyWithImpl<$Res>
    extends _$FastLaughEventCopyWithImpl<$Res, _$unlikedVieos>
    implements _$$unlikedVieosCopyWith<$Res> {
  __$$unlikedVieosCopyWithImpl(
      _$unlikedVieos _value, $Res Function(_$unlikedVieos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$unlikedVieos(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$unlikedVieos implements unlikedVieos {
  const _$unlikedVieos({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FastLaughEvent.unlikedVieos(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$unlikedVieos &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$unlikedVieosCopyWith<_$unlikedVieos> get copyWith =>
      __$$unlikedVieosCopyWithImpl<_$unlikedVieos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideos,
    required TResult Function(int id) unlikedVieos,
  }) {
    return unlikedVieos(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideos,
    TResult? Function(int id)? unlikedVieos,
  }) {
    return unlikedVieos?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideos,
    TResult Function(int id)? unlikedVieos,
    required TResult orElse(),
  }) {
    if (unlikedVieos != null) {
      return unlikedVieos(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(likedVideos value) likedVideos,
    required TResult Function(unlikedVieos value) unlikedVieos,
  }) {
    return unlikedVieos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(likedVideos value)? likedVideos,
    TResult? Function(unlikedVieos value)? unlikedVieos,
  }) {
    return unlikedVieos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(likedVideos value)? likedVideos,
    TResult Function(unlikedVieos value)? unlikedVieos,
    required TResult orElse(),
  }) {
    if (unlikedVieos != null) {
      return unlikedVieos(this);
    }
    return orElse();
  }
}

abstract class unlikedVieos implements FastLaughEvent {
  const factory unlikedVieos({required final int id}) = _$unlikedVieos;

  int get id;
  @JsonKey(ignore: true)
  _$$unlikedVieosCopyWith<_$unlikedVieos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FastLaughState {
  List<Downloads> get VideosList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FastLaughStateCopyWith<FastLaughState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastLaughStateCopyWith<$Res> {
  factory $FastLaughStateCopyWith(
          FastLaughState value, $Res Function(FastLaughState) then) =
      _$FastLaughStateCopyWithImpl<$Res, FastLaughState>;
  @useResult
  $Res call({List<Downloads> VideosList, bool isLoading, bool isError});
}

/// @nodoc
class _$FastLaughStateCopyWithImpl<$Res, $Val extends FastLaughState>
    implements $FastLaughStateCopyWith<$Res> {
  _$FastLaughStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? VideosList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      VideosList: null == VideosList
          ? _value.VideosList
          : VideosList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $FastLaughStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Downloads> VideosList, bool isLoading, bool isError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$FastLaughStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? VideosList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$_Initial(
      VideosList: null == VideosList
          ? _value._VideosList
          : VideosList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<Downloads> VideosList,
      required this.isLoading,
      required this.isError})
      : _VideosList = VideosList;

  final List<Downloads> _VideosList;
  @override
  List<Downloads> get VideosList {
    if (_VideosList is EqualUnmodifiableListView) return _VideosList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_VideosList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'FastLaughState(VideosList: $VideosList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._VideosList, _VideosList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_VideosList), isLoading, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements FastLaughState {
  const factory _Initial(
      {required final List<Downloads> VideosList,
      required final bool isLoading,
      required final bool isError}) = _$_Initial;

  @override
  List<Downloads> get VideosList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
