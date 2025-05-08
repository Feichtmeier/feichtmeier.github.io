import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:watch_it/watch_it.dart';

import 'app.dart';
import 'contributor_service.dart';

Future<void> main() async {
  di
    ..registerLazySingleton<GitHub>(() => GitHub())
    ..registerSingletonAsync<ContributorService>(
      () async {
        final service = ContributorService(gitHub: GitHub());
        await service.init();
        return service;
      },
    );

  runApp(const App());
}
