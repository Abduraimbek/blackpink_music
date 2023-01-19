import 'package:blackpink_music/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'player_controllers.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void backpressed() {
      final location = GoRouter.of(context).location;

      if (location == '/player/playlist') {
        context.go('/player/main');
      } else {
        context.go('/');
      }
    }

    return WillPopScope(
      onWillPop: () async {
        backpressed();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            iconSize: AppTheme.playerPageIconsSize,
            onPressed: backpressed,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: child),
              const PlayerControllers(),
            ],
          ),
        ),
      ),
    );
  }
}
