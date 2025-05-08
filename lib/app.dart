import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'about_page.dart';
import 'constants.dart';
import 'contributors_page.dart';
import 'globals.dart';
import 'home_page.dart';
import 'projects_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final pTT = PageTransitionsTheme(
      builders: {
        for (final platform in TargetPlatform.values)
          platform: const _NoTransitionsBuilder(),
      },
    );
    return MaterialApp(
      title: kAppTitle,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: yaruLight.copyWith(pageTransitionsTheme: pTT),
      darkTheme: yaruDark.copyWith(
        pageTransitionsTheme: pTT,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/contributors': (context) => const ContributorsPage(),
        '/projects': (context) => const ProjectsPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}

class _NoTransitionsBuilder extends PageTransitionsBuilder {
  const _NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return child!;
  }
}
