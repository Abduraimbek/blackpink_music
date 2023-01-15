import 'package:blackpink_music/models/song_enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SongListItem extends StatelessWidget {
  const SongListItem({
    super.key,
    required this.song,
    required this.selected,
    required this.playing,
    required this.onTap,
  });

  final SongEnum song;
  final bool selected;
  final bool playing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          song.album.imagePath,
        ),
      ),
      title: Text(song.name),
      subtitle: Text(song.getPerformersString),
      trailing: selected
          ? Lottie.asset(
              'assets/lotties/sound.json',
              animate: playing,
            )
          : null,
    );
  }
}
