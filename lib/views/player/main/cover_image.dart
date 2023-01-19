import 'package:blackpink_music/controllers/notifiers.dart';
import 'package:blackpink_music/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoverImage extends ConsumerWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    const borderRadius = 14.0;

    final currSong = ref.watch(currentSongProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 15,
          top: 15,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              width: .3,
              color: theme.colorScheme.onBackground,
            ),
          ),
          margin: EdgeInsets.zero,
          elevation: 0,
          shadowColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              currSong?.album.imagePath ?? AppConstants.imageMusicPlaceholder,
            ),
          ),
        ),
      ),
    );
  }
}
