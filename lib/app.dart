import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/ui/component/scaffold_messenger.dart';
import 'core/ui/component/theme_data.dart';
import 'feature/home/ui/home_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Traffic Light',
      theme: ref.watch(themeDataProvider),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: ref.watch(scaffoldMessengerProvider),
      home: const HomePage(),
    );
  }
}
