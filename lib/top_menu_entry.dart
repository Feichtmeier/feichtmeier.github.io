import 'package:flutter/material.dart';
import 'package:yaru/constants.dart';

import 'build_context_x.dart';

class TopMenuEntry extends StatelessWidget {
  const TopMenuEntry({
    super.key,
    this.padding = 20.0,
    required this.text,
    required this.route,
  });

  final String text;
  final double padding;
  final String route;

  @override
  Widget build(BuildContext context) {
    final isSelected = ModalRoute.of(context)?.settings.name == route;
    final nav = Navigator.of(context);
    return TextButton(
      onPressed: () => isSelected ? nav.maybePop() : nav.pushNamed(route),
      child: Text(
        text,
        style: context.theme.textTheme.bodyLarge?.copyWith(
          color: isSelected
              ? context.theme.colorScheme.primary
              : context.theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

List<Widget> createTopMenu(BuildContext context) => [
      const TopMenuEntry(
        text: 'About',
        route: '/about',
      ),
      const TopMenuEntry(
        text: 'Projects',
        route: '/projects',
      ),
      const SizedBox(
        width: kYaruPagePadding,
      ),
    ];
