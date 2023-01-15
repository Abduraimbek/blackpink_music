import 'package:blackpink_music/controllers/notifiers.dart';
import 'package:blackpink_music/controllers/playlist_controller.dart';
import 'package:blackpink_music/models/song_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CoverImage extends ConsumerStatefulWidget {
  const CoverImage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CoverImageState();
}

class _CoverImageState extends ConsumerState<CoverImage> {
  late final PageController pageController;
  late final List<SongEnum> songs;
  late int currentIndex;

  @override
  void initState() {
    super.initState();

    songs = ref.read(playListControllerProvider);

    currentIndex = ref.read(currentSongIndexProvider) + 1000 * songs.length;

    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        Logger().e(index);
        ref
            .read(playListControllerProvider.notifier)
            .seekToIndex(index % songs.length);
      },
      itemBuilder: (context, index) {
        final song = songs[index % songs.length];

        return Image.asset(
          song.album.imagePath,
        );
      },
    );
  }
}
