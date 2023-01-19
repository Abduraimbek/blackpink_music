import 'package:blackpink_music/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FunctionButtons extends ConsumerWidget {
  const FunctionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppTheme.playerPageHorizontalPadding,
        right: AppTheme.playerPageHorizontalPadding,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildButton(
            onPressed: () {},
            icon: Icons.format_list_bulleted_rounded,
          ),
          BuildButton(
            onPressed: () {},
            icon: Icons.favorite_outline_rounded,
          ),
          BuildButton(
            onPressed: () {},
            icon: Icons.add_rounded,
          ),
        ],
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed,
      iconSize: AppTheme.playerPageIconsSize,
      icon: Icon(
        icon,
        color: theme.colorScheme.onBackground,
      ),
    );
  }
}
