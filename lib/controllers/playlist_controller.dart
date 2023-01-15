import 'package:blackpink_music/models/song_enum.dart';
import 'package:blackpink_music/providers/player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'streams.dart';

part 'playlist_controller.g.dart';

@Riverpod(keepAlive: true)
class PlayListController extends _$PlayListController {
  @override
  List<SongEnum> build() {
    final sequence = ref.watch(sequenceListStreamProvider).value;
    List<SongEnum> songs = [];

    if (sequence != null) {
      for (final source in sequence) {
        final tag = source.tag;
        if (tag is SongEnum) {
          songs.add(tag);
        }
      }
    }

    return songs;
  }

  Future<void> pressPlayOrPause(bool playing) async {
    if (playing) {
      await ref.read(playerProvider).pause();
    } else {
      await ref.read(playerProvider).play();
    }
  }

  Future<void> pressNext() async {
    await ref.read(playerProvider).next();
  }

  Future<void> preesPrevious() async {
    await ref.read(playerProvider).previous();
  }

  Future<void> onSeek(Duration duration) async {
    await ref.read(playerProvider).seek(duration);
  }

  Future<void> changeLoopMode(LoopMode loopMode) async {
    LoopMode newMode;
    switch (loopMode) {
      case LoopMode.off:
        newMode = LoopMode.one;
        break;
      case LoopMode.one:
        newMode = LoopMode.all;
        break;
      case LoopMode.all:
        newMode = LoopMode.off;
        break;
    }
    await ref.read(playerProvider).setLoopMode(newMode);
  }

  Future<void> seekToIndex(int index) async {
    await ref.read(playerProvider).seekToIndex(index);
  }
}
