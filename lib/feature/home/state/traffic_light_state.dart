import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'traffic_light_state.freezed.dart';
part 'traffic_light_state.g.dart';

@freezed
class TrafficLightState with _$TrafficLightState {
  const factory TrafficLightState({
    /// 現在の信号機の状態
    @Default(TrafficLightStatus.green) TrafficLightStatus currentStatus,

    /// 現在の信号機の状態が始まってからの経過時間
    @Default(0) int elapsedTime,

    /// 現在の信号機の状態の残り時間
    @Default(0) int remainingTime,
  }) = _TrafficLightState;
}

enum TrafficLightStatus {
  red,
  yellow,
  green,
  ;

  /// 次の信号機の状態を返す。
  TrafficLightStatus get next => switch (this) {
        TrafficLightStatus.red => TrafficLightStatus.green,
        TrafficLightStatus.yellow => TrafficLightStatus.red,
        TrafficLightStatus.green => TrafficLightStatus.yellow,
      };
}

@riverpod
class TrafficLightStateNotifier extends _$TrafficLightStateNotifier {
  @override
  TrafficLightState build() {
    return const TrafficLightState();
  }

  /// 時間を進める。
  void tick() {
    final elapsedTime = state.elapsedTime + 1;
    final remainingTime = _getStayingTime(state.currentStatus) - elapsedTime;
    if (remainingTime <= 0) {
      final nextStatus = state.currentStatus.next;
      state = state.copyWith(
        currentStatus: nextStatus,
        elapsedTime: 0,
        remainingTime: _getStayingTime(nextStatus),
      );
    } else {
      state = state.copyWith(
        elapsedTime: elapsedTime,
        remainingTime: remainingTime,
      );
    }
  }

  /// 信号機の状態ごとの滞在時間を返す。
  static int _getStayingTime(TrafficLightStatus status) => switch (status) {
        TrafficLightStatus.red => 10,
        TrafficLightStatus.yellow => 3,
        TrafficLightStatus.green => 8,
      };

  /// 強制的に信号機の状態を変える。
  Future<void> updateStatus(TrafficLightStatus nextStatus) async {
    // 非同期処理にしたいので1秒待つ。
    await Future<void>.delayed(const Duration(seconds: 1));

    // 赤信号 => 青信号
    if (state.currentStatus == TrafficLightStatus.red &&
        nextStatus == TrafficLightStatus.green) {
      state = state.copyWith(
        currentStatus: nextStatus,
        elapsedTime: 0,
        remainingTime: _getStayingTime(nextStatus),
      );
    }
  }
}
