import 'package:blackpink_music/controllers/notifiers.dart';
import 'package:blackpink_music/controllers/songs_controller.dart';
import 'package:blackpink_music/views/common/song_list_item.dart';
import 'package:blackpink_music/views/common/sort_and_play_all_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongListView extends ConsumerWidget {
  const SongListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final songs = ref.watch(songsControllerProvider);
    final count = songs.length;
    final currentSong = ref.watch(currentSongProvider);
    final playing = ref.watch(playingProvider);

    return Material(
      color: theme.colorScheme.background,
      child: ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SortAndPlayAllButtons();
          }

          final song = songs[index - 1];

          return SongListItem(
            song: song,
            selected: currentSong == song,
            playing: playing,
            onTap: () =>
                ref.read(songsControllerProvider.notifier).pressSong(song),
          );
        },
        separatorBuilder: (context, index) {
          if (index == 0) return const SizedBox(height: 0, width: 0);
          return const Divider();
        },
        itemCount: count + 1,
      ),
    );
  }
}
