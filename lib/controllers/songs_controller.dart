import 'package:blackpink_music/models/song_enum.dart';
import 'package:blackpink_music/providers/player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'songs_controller.g.dart';

@Riverpod(keepAlive: true)
class SongsController extends _$SongsController {
  @override
  List<SongEnum> build() {
    return SongEnum.values;
  }

  Future<void> pressSong(SongEnum song) async {
    if (state.isEmpty) return;
    await ref.read(playerProvider).setPlaylistAndPlay(songs: state, song: song);
  }

  Future<void> pressShuffleAllButton() async {}

  Future<void> pressPlayAllButton() async {}
}
