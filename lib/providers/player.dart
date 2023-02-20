import 'dart:math';

import 'package:blackpink_music/models/song_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';

final playerProvider = Provider<Player>((ref) {
  return Player(
    audioPlayer: AudioPlayer(),
    logger: Logger(),
    random: Random(),
  );
});

class Player {
  Player({
    required this.audioPlayer,
    required this.logger,
    required this.random,
  });

  final AudioPlayer audioPlayer;
  final Logger logger;
  final Random random;

  int? get playlistCount => audioPlayer.sequence?.length;

  Future<void> setPlaylistAndPlay({
    required List<SongEnum> songs,
    required SongEnum song,
  }) async {
    await guard(() async {
      final playlist = ConcatenatingAudioSource(children: [
        for (final song in songs)
          ProgressiveAudioSource(
            Uri.parse('asset:///${song.path}'),
            tag: song,
          ),
      ]);

      var index = songs.indexWhere((x) => x == song);
      if (index < 0) index = 0;
      await audioPlayer.setAudioSource(
        playlist,
        initialIndex: index,
      );

      await audioPlayer.play();
    });
  }

  Future<void> previous() async {
    await guard(() async {
      if (audioPlayer.hasPrevious) {
        await audioPlayer.seekToPrevious();
      } else {
        final count = playlistCount;
        if (count != null && count > 0) {
          await audioPlayer.seek(Duration.zero, index: count - 1);
        }
      }
    });
  }

  Future<void> next() async {
    await guard(() => audioPlayer.hasNext
        ? audioPlayer.seekToNext()
        : audioPlayer.seek(Duration.zero, index: 0));
  }

  Future<void> pause() async {
    await guard(audioPlayer.pause);
  }

  Future<void> play() async {
    await guard(audioPlayer.play);
  }

  Future<void> seek(Duration position) async {
    await guard(() => audioPlayer.seek(position));
  }

  Future<void> setLoopMode(LoopMode loopMode) async {
    await guard(() => audioPlayer.setLoopMode(loopMode));
  }

  Future<void> seekToIndex(int index) async {
    await guard(() => audioPlayer.seek(Duration.zero, index: index));
  }

  Future<void> seekShuffle() async {
    await guard(() async {
      final count = playlistCount;
      if (count != null && count > 0) {
        final index = random.nextInt(count);
        await audioPlayer.seek(Duration.zero, index: index);
      }
    });
  }

  Future<void> guard(Future Function() cb) async {
    try {
      await cb.call();
    } catch (e) {
      logger.e('$cb: $e');
    }
  }
}
