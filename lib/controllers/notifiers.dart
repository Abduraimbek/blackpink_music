import 'package:blackpink_music/controllers/songs_controller.dart';
import 'package:blackpink_music/models/song_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'streams.dart';

part 'notifiers.g.dart';
part 'notifiers.freezed.dart';

@Riverpod(keepAlive: true)
int songsCount(SongsCountRef ref) {
  return ref.watch(songsControllerProvider).length;
}

@Riverpod(keepAlive: true)
int currentSongIndex(CurrentSongIndexRef ref) {
  final songs = ref.watch(songsControllerProvider);
  final currSong = ref.watch(currentSongProvider);

  var index = 0;
  if (currSong != null) {
    index = songs.indexOf(currSong);
    if (index < 0) index = 0;
  }

  return index;
}

@Riverpod(keepAlive: true)
SongEnum? currentSong(CurrentSongRef ref) {
  final sequence = ref.watch(currentSequenceStateStreamProvider).value;
  final tag = sequence?.currentSource?.tag;
  if (tag is SongEnum) return tag;
  return null;
}

@Riverpod(keepAlive: true)
bool playing(PlayingRef ref) {
  return ref.watch(playingStreamProvider).value ?? false;
}

@Riverpod(keepAlive: true)
LoopMode loopMode(LoopModeRef ref) {
  return ref.watch(loopModeStreamProvider).value ?? LoopMode.off;
}

@Riverpod(keepAlive: true)
ProgressBarState progressBar(ProgressBarRef ref) {
  final position = ref.watch(positionDurationStreamProvider);
  final total = ref.watch(totalDurationStreamProvider);

  return ProgressBarState(
    current: position.value ?? Duration.zero,
    total: total.value ?? Duration.zero,
  );
}

@freezed
class ProgressBarState with _$ProgressBarState {
  const factory ProgressBarState({
    required Duration current,
    required Duration total,
  }) = _ProgressBarState;
}
