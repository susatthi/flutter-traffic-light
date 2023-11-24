import 'package:flutter/material.dart';

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
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TrafficLight(),
          SizedBox(height: 16),
          CrosswalkButton(),
        ],
      ),
    );
  }
}
