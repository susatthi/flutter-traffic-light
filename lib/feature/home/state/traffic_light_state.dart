import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'traffic_light_state.freezed.dart';
part 'traffic_light_state.g.dart';

@freezed
class TrafficLightState with _$TrafficLightState {
  const factory TrafficLightState({
    @Default(TrafficLightStatus.red) TrafficLightStatus status,
    @Default(0) int elapsedSeconds,
  }) = _TrafficLightState;
  const TrafficLightState._();

  int get remainingSeconds => status.periodSeconds - elapsedSeconds;
}

enum TrafficLightStatus {
  red(periodSeconds: 10),
  yellow(periodSeconds: 3),
  green(periodSeconds: 8),
  ;

  const TrafficLightStatus({
    required this.periodSeconds,
  });

  final int periodSeconds;

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
    final elapsedSeconds = state.elapsedSeconds + 1;
    if (elapsedSeconds >= state.status.periodSeconds) {
      state = state.copyWith(
        status: state.status.next,
        elapsedSeconds: 0,
      );
    } else {
      state = state.copyWith(
        elapsedSeconds: elapsedSeconds,
      );
    }
  }

  /// 歩行ボタンを押した。
  ///
  /// 1秒間待ったあと、赤信号なら青信号に変える。それ以外は何もしない。
  Future<void> pressPedestrianButton() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (state.status == TrafficLightStatus.red) {
      state = state.copyWith(
        status: TrafficLightStatus.green,
        elapsedSeconds: 0,
      );
    }
  }
}
