import 'package:blackpink_music/controllers/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongNameAndPerformer extends ConsumerWidget {
  const SongNameAndPerformer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final currentSong = ref.watch(currentSongProvider);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentSong?.name ?? '',
            style: theme.textTheme.titleLarge,
          ),
          Text(
            currentSong?.getPerformersString ?? '',
            style: theme.textTheme.bodyText2?.copyWith(
              color: theme.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
