import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/component/scaffold_messenger.dart';
import '../../use_case/press_crosswalk_button.dart';

class CrosswalkButton extends ConsumerWidget {
  const CrosswalkButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pressCrosswalkButtonUseCaseProvider, (previous, next) {
      next.when(
        data: (_) {},
        error: (e, s) {
          ref
              .read(scaffoldMessengerProvider)
              .currentState
              ?.showSnackBar(const SnackBar(content: Text('エラーが発生しました')));
        },
        loading: () {},
      );
    });
    final isLoading = ref.watch(pressCrosswalkButtonUseCaseProvider).isLoading;
    return TextButton(
      onPressed: isLoading
          ? null
          : () =>
              ref.read(pressCrosswalkButtonUseCaseProvider.notifier).invoke(),
      child: const Text('歩行者ボタン'),
    );
  }
}
