import 'package:blackpink_music/controllers/notifiers.dart';
import 'package:blackpink_music/controllers/playlist_controller.dart';
import 'package:blackpink_music/models/song_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomPlayerView extends ConsumerWidget {
  const BottomPlayerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentSong = ref.watch(currentSongProvider);

    if (currentSong == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        context.go('/player/main');
      },
      child: Material(
        color: theme.colorScheme.primaryContainer,
        child: Row(
          children: [
            BuildImage(currentSong: currentSong),
            BuildTitle(currentSong: currentSong),
            BuildButton(
              onPressed:
                  ref.read(playListControllerProvider.notifier).preesPrevious,
              icon: Icons.skip_previous_rounded,
            ),
            Consumer(
              builder: (context, ref, child) {
                final playing = ref.watch(playingProvider);

                return BuildButton(
                  onPressed: () => ref
                      .read(playListControllerProvider.notifier)
                      .pressPlayOrPause(playing),
                  icon:
                      playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                );
              },
            ),
            BuildButton(
              onPressed:
                  ref.read(playListControllerProvider.notifier).pressNext,
              icon: Icons.skip_next_rounded,
            ),
            const SizedBox(width: 7),
          ],
        ),
      ),
    );
  }
}

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    super.key,
    required this.currentSong,
  });

  final SongEnum currentSong;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currentSong.name,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onBackground,
              height: 0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            currentSong.getPerformersString,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({
    super.key,
    required this.currentSong,
  });

  final SongEnum currentSong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: CircleAvatar(
        radius: 23,
        backgroundImage: AssetImage(
          currentSong.album.imagePath,
        ),
      ),
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

    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: theme.colorScheme.onBackground,
      ),
    );
  }
}
