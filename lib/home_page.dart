import 'build_context_x.dart';
import 'logo.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:shimmer/shimmer.dart';
import 'package:universal_html/html.dart' as html;
import 'package:yaru/widgets.dart';

import 'constants.dart';
import 'plated_icon.dart';
import 'repositories.dart';
import 'screen_message.dart';
import 'sub_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPage(
      body: Center(
        child: YaruCarousel(
          navigationControls: false,
          height: double.infinity,
          width: double.infinity,
          placeIndicator: false,
          controller: YaruCarouselController(
            viewportFraction: 1,
            autoScroll: true,
            autoScrollDuration: const Duration(
              seconds: 6,
            ),
            scrollAnimationDuration: const Duration(seconds: 1),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ScreenMessage(
                icon: const Logo(
                  size: 100,
                  duration: Duration.zero,
                ),
                title: const Text(kWelcomeTitle),
                subTitle: Shimmer.fromColors(
                  baseColor: context.baseColor,
                  highlightColor: context.highlightColor,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () => Navigator.of(context).pushNamed('/projects'),
                    child: const Text(kWelcomeButtonText),
                  ),
                ),
                label: const Text(kAppTitle),
              ),
            ),
            ...repositories.map(
              (e) {
                void onTap() =>
                    html.window.open(p.join(kGitHubPrefix, e.$1, e.$2), '');
                return ScreenMessage(
                  icon: PlatedIcon(
                    icon: e.$4,
                    onTap: onTap,
                  ),
                  title: Text(e.$2),
                  subTitle: Shimmer.fromColors(
                    baseColor: context.baseColor,
                    highlightColor: context.highlightColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: onTap,
                      child: const Text('GitHub'),
                    ),
                  ),
                  label: Text(e.$1),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
