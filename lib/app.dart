import 'package:blackpink_music/controllers/playlist_controller.dart';
import 'package:blackpink_music/utils/app_constants.dart';
import 'package:blackpink_music/utils/app_router.dart';
import 'package:blackpink_music/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    ref.read(playListControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      routerConfig: AppRouter.router,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      builder: (context, child) => ScrollConfiguration(
        behavior: const BouncingBehavior(),
        child: child!,
      ),
    );
  }
}

class BouncingBehavior extends ScrollBehavior {
  const BouncingBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();
}
