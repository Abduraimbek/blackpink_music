import 'package:blackpink_music/utils/app_constants.dart';
import 'package:blackpink_music/views/common/song_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
      ),
      body: const SongListView(),
    );
  }
}
