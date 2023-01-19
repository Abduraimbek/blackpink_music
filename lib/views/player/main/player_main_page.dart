import 'package:flutter/material.dart';

import 'cover_image.dart';
import 'song_name_and_performer.dart';
import 'function_buttons.dart';

class PlayerMainPage extends StatelessWidget {
  const PlayerMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: const [
              CoverImage(),
              SongNameAndPerformer(),
            ],
          ),
        ),
        const FunctionButtons(),
      ],
    );
  }
}
