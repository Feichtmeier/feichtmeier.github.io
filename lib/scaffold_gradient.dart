import 'build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

BoxDecoration scaffoldGradient(BuildContext context) {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: context.isLight
          ? [
              Colors.white,
              Colors.white,
            ]
          : [
              const Color(0xFF77216F).scale(lightness: -0.8),
              YaruColors.orange.scale(lightness: -0.8),
            ],
    ),
  );
}
