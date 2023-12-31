// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traffic_light_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrafficLightState {
  /// 現在の信号機の状態
  TrafficLightStatus get status => throw _privateConstructorUsedError;

  /// 現在の信号機の状態の残り時間
  int get remainingTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrafficLightStateCopyWith<TrafficLightState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrafficLightStateCopyWith<$Res> {
  factory $TrafficLightStateCopyWith(
          TrafficLightState value, $Res Function(TrafficLightState) then) =
      _$TrafficLightStateCopyWithImpl<$Res, TrafficLightState>;
  @useResult
  $Res call({TrafficLightStatus status, int remainingTime});
}

/// @nodoc
class _$TrafficLightStateCopyWithImpl<$Res, $Val extends TrafficLightState>
    implements $TrafficLightStateCopyWith<$Res> {
  _$TrafficLightStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? remainingTime = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrafficLightStatus,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrafficLightStateImplCopyWith<$Res>
    implements $TrafficLightStateCopyWith<$Res> {
  factory _$$TrafficLightStateImplCopyWith(_$TrafficLightStateImpl value,
          $Res Function(_$TrafficLightStateImpl) then) =
      __$$TrafficLightStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TrafficLightStatus status, int remainingTime});
}

/// @nodoc
class __$$TrafficLightStateImplCopyWithImpl<$Res>
    extends _$TrafficLightStateCopyWithImpl<$Res, _$TrafficLightStateImpl>
    implements _$$TrafficLightStateImplCopyWith<$Res> {
  __$$TrafficLightStateImplCopyWithImpl(_$TrafficLightStateImpl _value,
      $Res Function(_$TrafficLightStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? remainingTime = null,
  }) {
    return _then(_$TrafficLightStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrafficLightStatus,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TrafficLightStateImpl implements _TrafficLightState {
  const _$TrafficLightStateImpl(
      {required this.status, required this.remainingTime});

  /// 現在の信号機の状態
  @override
  final TrafficLightStatus status;

  /// 現在の信号機の状態の残り時間
  @override
  final int remainingTime;

  @override
  String toString() {
    return 'TrafficLightState(status: $status, remainingTime: $remainingTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrafficLightStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, remainingTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrafficLightStateImplCopyWith<_$TrafficLightStateImpl> get copyWith =>
      __$$TrafficLightStateImplCopyWithImpl<_$TrafficLightStateImpl>(
          this, _$identity);
}

abstract class _TrafficLightState implements TrafficLightState {
  const factory _TrafficLightState(
      {required final TrafficLightStatus status,
      required final int remainingTime}) = _$TrafficLightStateImpl;

  @override

  /// 現在の信号機の状態
  TrafficLightStatus get status;
  @override

  /// 現在の信号機の状態の残り時間
  int get remainingTime;
  @override
  @JsonKey(ignore: true)
  _$$TrafficLightStateImplCopyWith<_$TrafficLightStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
