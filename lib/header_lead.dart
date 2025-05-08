import 'package:flutter/material.dart';
import 'package:yaru/constants.dart';
import 'constants.dart';
import 'logo.dart';

class HeaderLead extends StatelessWidget {
  const HeaderLead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = ModalRoute.of(context)?.settings.name == '/';

    return Padding(
      padding: const EdgeInsets.only(left: kYaruPagePadding),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (!isSelected) {
              Navigator.of(context).pushReplacementNamed('/');
            }
          },
          child: const Logo(
            size: kLeadingWidth,
            duration: Duration.zero,
          ),
        ),
      ),
    );
  }
}
