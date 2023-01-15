import 'package:blackpink_music/providers/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

// Track Playing Or Not
final playingStreamProvider = StreamProvider<bool>((ref) {
  return ref.watch(playerProvider).audioPlayer.playingStream;
});

// Current Playing Track Info
final currentSequenceStateStreamProvider =
    StreamProvider<SequenceState?>((ref) {
  return ref.watch(playerProvider).audioPlayer.sequenceStateStream;
});

// Playlist
final sequenceListStreamProvider =
    StreamProvider<List<IndexedAudioSource>?>((ref) {
  return ref.watch(playerProvider).audioPlayer.sequenceStream;
});

// Current Duration of Playing Track
final positionDurationStreamProvider = StreamProvider<Duration>((ref) {
  return ref.watch(playerProvider).audioPlayer.positionStream;
});

// Total Duration of Playing Track
final totalDurationStreamProvider = StreamProvider<Duration?>((ref) {
  return ref.watch(playerProvider).audioPlayer.durationStream;
});

// LoopMode
final loopModeStreamProvider = StreamProvider<LoopMode>((ref) {
  return ref.watch(playerProvider).audioPlayer.loopModeStream;
});
