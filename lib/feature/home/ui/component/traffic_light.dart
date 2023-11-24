import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../state/traffic_light_state.dart';

class TrafficLight extends StatelessWidget {
  const TrafficLight({super.key});

  @override
  Widget build(BuildContext context) {
    return TrafficLightBuilder(
      builder: (state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 400,
              width: 200,
              child: _TrafficLight(
                state: state,
                iconSize: 150,
              ),
            ),
            const Gap(8),
            SizedBox(
              width: 80,
              height: 200,
              child: _RemainingSignage(
                // 黄色の場合は残り時間を表示しない。
                remainingTime: state.currentStatus == TrafficLightStatus.yellow
                    ? 0
                    : state.remainingTime,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TrafficLight extends StatelessWidget {
  const _TrafficLight({
    required this.state,
    required this.iconSize,
  });

  final TrafficLightState state;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return switch (state.currentStatus) {
      TrafficLightStatus.red => Column(
          children: [
            _RedLightOn(
              iconSize: iconSize,
            ),
            _GreenLightOff(
              iconSize: iconSize,
            ),
          ],
        ),
      TrafficLightStatus.yellow => Column(
          children: [
            _RedLightOff(
              iconSize: iconSize,
            ),
            _GreenLightBlinking(
              iconSize: iconSize,
            ),
          ],
        ),
      TrafficLightStatus.green => Column(
          children: [
            _RedLightOff(
              iconSize: iconSize,
            ),
            _GreenLightOn(
              iconSize: iconSize,
            ),
          ],
        ),
    };
  }
}

const _redOnBackgroundColor = Color(0xFFEA5350);
const _greenOnBackgroundColor = Color(0xFF62C0B5);
const _offBackgroundColor = Color(0xFF3B2B29);
const _onForegroundColor = Color(0xFFFEE799);
const _offForegroundColor = Color(0xFF5E504F);

class _RedLightOn extends StatelessWidget {
  const _RedLightOn({
    required this.iconSize,
  });
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return _Light(
      icon: Icons.accessibility,
      iconSize: iconSize,
      backgroundColor: _redOnBackgroundColor,
      foregroundColor: _onForegroundColor,
    );
  }
}

class _RedLightOff extends StatelessWidget {
  const _RedLightOff({
    required this.iconSize,
  });
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return _Light(
      icon: Icons.accessibility,
      iconSize: iconSize,
      backgroundColor: _offBackgroundColor,
      foregroundColor: _offForegroundColor,
    );
  }
}

class _GreenLightBlinking extends StatefulWidget {
  const _GreenLightBlinking({
    required this.iconSize,
  });
  final double iconSize;

  @override
  State<_GreenLightBlinking> createState() => _GreenLightBlinkingState();
}

class _GreenLightBlinkingState extends State<_GreenLightBlinking> {
  late final Timer timer;
  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _isOn = !_isOn;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Light(
      icon: Icons.directions_walk,
      iconSize: widget.iconSize,
      backgroundColor: _greenOnBackgroundColor,
      foregroundColor: _isOn ? _onForegroundColor : _offForegroundColor,
    );
  }
}

class _GreenLightOn extends StatelessWidget {
  const _GreenLightOn({
    required this.iconSize,
  });
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return _Light(
      icon: Icons.directions_walk,
      iconSize: iconSize,
      backgroundColor: _greenOnBackgroundColor,
      foregroundColor: _onForegroundColor,
    );
  }
}

class _GreenLightOff extends StatelessWidget {
  const _GreenLightOff({
    required this.iconSize,
  });
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return _Light(
      icon: Icons.directions_walk,
      iconSize: iconSize,
      backgroundColor: _offBackgroundColor,
      foregroundColor: _offForegroundColor,
    );
  }
}

class _Light extends StatelessWidget {
  const _Light({
    required this.icon,
    required this.iconSize,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: backgroundColor,
          child: Icon(
            icon,
            color: foregroundColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

class _RemainingSignage extends StatelessWidget {
  const _RemainingSignage({
    required this.remainingTime,
  });

  final int remainingTime;

  static const _maxBarCount = 10;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _offForegroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          children: [
            for (var i = _maxBarCount + 1; i > 1; i--)
              Expanded(
                child: _RemainingBar(
                  isOn: i <= remainingTime,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _RemainingBar extends StatelessWidget {
  const _RemainingBar({
    required this.isOn,
  });

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: isOn ? _onForegroundColor : _offForegroundColor,
        ),
      ),
    );
  }
}

class TrafficLightBuilder extends ConsumerStatefulWidget {
  const TrafficLightBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(TrafficLightState state) builder;

  @override
  ConsumerState<TrafficLightBuilder> createState() =>
      _TrafficLightBuilderState();
}

class _TrafficLightBuilderState extends ConsumerState<TrafficLightBuilder> {
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(trafficLightStateNotifierProvider.notifier).tick();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(trafficLightStateNotifierProvider);
    return widget.builder(state);
  }
}
