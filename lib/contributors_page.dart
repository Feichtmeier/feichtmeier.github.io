import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import 'contributor_grid.dart';
import 'splash_screen.dart';
import 'sub_page.dart';

class ContributorsPage extends StatefulWidget {
  const ContributorsPage({super.key});

  @override
  State<ContributorsPage> createState() => _ContributorsPageState();
}

class _ContributorsPageState extends State<ContributorsPage> {
  late Future<void> _allReady;

  @override
  void initState() {
    super.initState();
    _allReady = di.allReady();
  }

  @override
  Widget build(BuildContext context) {
    return SubPage(
      body: FutureBuilder(
        future: _allReady,
        builder: (context, snapshot) =>
            snapshot.hasData ? const ContributorGrid() : const SplashScreen(),
      ),
    );
  }
}
