import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/traffic_light_state.dart';

part 'press_crosswalk_button.g.dart';

@riverpod
class PressCrosswalkButtonUseCase extends _$PressCrosswalkButtonUseCase {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> invoke() async {
    if (state.isLoading) {
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(trafficLightStateNotifierProvider.notifier)
          .updateStatus(TrafficLightStatus.green);
    });
  }
}
