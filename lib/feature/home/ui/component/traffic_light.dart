import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/traffic_light_state.dart';

class TrafficLightBuilder extends ConsumerStatefulWidget {
  const TrafficLightBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(TrafficLightState state) builder;

  @override
  ConsumerState<TrafficLightBuilder> createState() =>
      _TrafficLightMachineState();
}

class _TrafficLightMachineState extends ConsumerState<TrafficLightBuilder> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(trafficLightStateNotifierProvider.notifier).tick();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(trafficLightStateNotifierProvider);
    return widget.builder(state);
  }
}
