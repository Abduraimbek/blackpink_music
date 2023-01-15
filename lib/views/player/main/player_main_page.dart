import 'package:flutter/material.dart';

import 'cover_image.dart';

class PlayerMainPage extends StatelessWidget {
  const PlayerMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: CoverImage(),
        ),
      ],
    );
  }
}
