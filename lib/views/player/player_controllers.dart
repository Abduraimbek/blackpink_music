import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:blackpink_music/controllers/notifiers.dart';
import 'package:blackpink_music/controllers/playlist_controller.dart';
import 'package:blackpink_music/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerControllers extends StatelessWidget {
  const PlayerControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppTheme.playerPageHorizontalPadding,
        right: AppTheme.playerPageHorizontalPadding,
        bottom: 55,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          BuildProgressBar(),
          SizedBox(height: 15),
          BuildControllers(),
        ],
      ),
    );
  }
}

class BuildProgressBar extends ConsumerWidget {
  const BuildProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onBackground;
    final progressBarState = ref.watch(progressBarProvider);

    return ProgressBar(
      progress: progressBarState.current,
      total: progressBarState.total,
      onSeek: ref.read(playListControllerProvider.notifier).onSeek,
      thumbColor: color,
      baseBarColor: color.withOpacity(.4),
      progressBarColor: color,
      timeLabelTextStyle: theme.textTheme.bodySmall?.copyWith(color: color),
    );
  }
}

class BuildControllers extends ConsumerWidget {
  const BuildControllers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playing = ref.watch(playingProvider);
    final loopMode = ref.watch(loopModeProvider);

    IconData loopModeIcon;
    switch (loopMode) {
      case LoopMode.off:
        loopModeIcon = Icons.arrow_right_alt_rounded;
        break;
      case LoopMode.one:
        loopModeIcon = Icons.repeat_one_rounded;
        break;
      case LoopMode.all:
        loopModeIcon = Icons.repeat_rounded;
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildButton(
          onPressed: () {},
          icon: Icons.shuffle_rounded,
        ),
        BuildButton(
          onPressed:
              ref.read(playListControllerProvider.notifier).preesPrevious,
          icon: Icons.skip_previous_rounded,
        ),
        BuildButton(
          onPressed: () => ref
              .read(playListControllerProvider.notifier)
              .pressPlayOrPause(playing),
          icon: playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
          size: 38,
        ),
        BuildButton(
          onPressed: ref.read(playListControllerProvider.notifier).pressNext,
          icon: Icons.skip_next_rounded,
        ),
        BuildButton(
          onPressed: () => ref
              .read(playListControllerProvider.notifier)
              .changeLoopMode(loopMode),
          icon: loopModeIcon,
        ),
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = AppTheme.playerPageIconsSize,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed,
      iconSize: size,
      icon: Icon(
        icon,
        color: theme.colorScheme.onBackground,
      ),
    );
  }
}
