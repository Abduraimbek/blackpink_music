import 'package:blackpink_music/controllers/songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortAndPlayAllButtons extends ConsumerWidget {
  const SortAndPlayAllButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Spacer(),
        BuildButton(
          onPressed:
              ref.read(songsControllerProvider.notifier).pressShuffleAllButton,
          icon: Icons.shuffle_rounded,
        ),
        const SizedBox(width: 12),
        BuildButton(
          onPressed:
              ref.read(songsControllerProvider.notifier).pressPlayAllButton,
          icon: Icons.play_arrow_rounded,
        ),
        const SizedBox(width: 18),
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: theme.colorScheme.onBackground.withOpacity(.2),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 0),
      padding: const EdgeInsets.all(5),
      child: Icon(
        icon,
        color: theme.colorScheme.onBackground,
      ),
    );
  }
}
