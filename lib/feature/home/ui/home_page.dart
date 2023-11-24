import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'component/crosswalk_button.dart';
import 'component/traffic_light.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _Body(),
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
          TrafficLight(),
          Gap(32),
          CrosswalkButton(),
        ],
      ),
    );
  }
}
