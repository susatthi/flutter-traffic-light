import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../traffic_light/ui/component/crosswalk_button.dart';
import '../../traffic_light/ui/component/traffic_light.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(32),
          TrafficLight(),
          Gap(32),
          CrosswalkButton(),
          Gap(32),
        ],
      ),
    );
  }
}
