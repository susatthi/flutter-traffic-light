import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/ui/component/material.dart';
import '../../../../core/ui/component/scaffold_messenger.dart';
import '../../use_case/press_crosswalk_button.dart';

class CrosswalkButton extends StatelessWidget {
  const CrosswalkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFFD444),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'おしてください',
              style: context.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(32),
            const _Button(),
            const Gap(16),
            Text(
              '横断歩行者は\nボタンをおしてください',
              style: context.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pressCrosswalkButtonUseCaseProvider, (previous, next) {
      next.when(
        data: (_) {},
        error: (e, s) {
          ref.read(scaffoldMessengerProvider).currentState?.showSnackBar(
                const SnackBar(
                  content: Text('青にできませんでした。'),
                  duration: Duration(seconds: 2),
                  width: 300,
                ),
              );
        },
        loading: () {},
      );
    });
    final isLoading = ref.watch(pressCrosswalkButtonUseCaseProvider).isLoading;
    return SizedBox.square(
      dimension: 80,
      child: IconButton(
        onPressed: isLoading
            ? null
            : () =>
                ref.read(pressCrosswalkButtonUseCaseProvider.notifier).invoke(),
        style: IconButton.styleFrom(
          foregroundColor: context.onError,
          backgroundColor: context.error,
          disabledBackgroundColor: context.onSurface.withOpacity(0.12),
          hoverColor: context.onError.withOpacity(0.08),
          focusColor: context.onError.withOpacity(0.12),
          highlightColor: context.onError.withOpacity(0.12),
        ),
        icon: const Icon(
          null,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
