import 'package:blackpink_music/views/home/home_page.dart';
import 'package:blackpink_music/views/player/main/player_main_page.dart';
import 'package:blackpink_music/views/player/player_page.dart';
import 'package:blackpink_music/views/player/playlist/player_playlist_page.dart';
import 'package:blackpink_music/views/shell/shell_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ShellPage(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey2,
        builder: (context, state, child) => PlayerPage(child: child),
        routes: [
          GoRoute(
            path: '/player/main',
            builder: (context, state) => const PlayerMainPage(),
          ),
          GoRoute(
            path: '/player/playlist',
            builder: (context, state) => const PlayerPlaylistPage(),
          ),
        ],
      ),
    ],
  );

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey2 = GlobalKey<NavigatorState>();
}
