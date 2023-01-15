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
    return WillPopScope(
      onWillPop: () async {
        final location = GoRouter.of(context).location;

        if (location == '/player/playlist') {
          context.go('/player/main');
        } else {
          context.go('/');
        }

        return false;
      },
      child: Scaffold(
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
