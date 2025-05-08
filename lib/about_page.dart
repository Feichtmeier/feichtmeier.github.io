import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:markdown_widget/widget/markdown.dart';
import 'package:yaru/widgets.dart';

import 'adaptive_padding.dart';
import 'constants.dart';
import 'sub_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPage(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: getAdaptiveHorizontalPadding(
                constraints: constraints,
                min: 20,
                limit: 800,
              ).copyWith(
                top: 20,
                bottom: 20,
              ),
              child: const ReadMe(),
            );
          },
        ),
      ),
    );
  }
}

class ReadMe extends StatefulWidget {
  const ReadMe({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  State<ReadMe> createState() => _ReadMeState();
}

class _ReadMeState extends State<ReadMe> {
  late Future<String?> _markdown;

  @override
  void initState() {
    super.initState();
    _markdown = _loadMarkdown();
  }

  Future<String?> _loadMarkdown() async {
    try {
      final response = await http.get(Uri.parse(readMeUrl));
      if (response.statusCode == 200) {
        return _removeAllHtmlTags(response.body);
      } else {
        throw Exception('Failed to load markdown');
      }
    } catch (e) {
      return null;
    }
  }

  String _removeAllHtmlTags(String htmlText) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _markdown,
        builder: (context, snapshot) => snapshot.hasData
            ? MarkdownWidget(
                data: snapshot.data!,
              )
            : const Center(
                child: YaruCircularProgressIndicator(),
              ),
      );
}
