import 'package:flutter/material.dart';
import 'package:flutter_application_21noiembrie/utils/color_utils.dart';
import 'package:share_plus/share_plus.dart';

import 'colored_screen.dart';
import '../utils/utils.dart';
import '../common/strings.dart' as strings;
import '../data/css_colors.dart';
import '../widgets/css_color_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void shareAll() {
    final buffer = StringBuffer();
    for (final cssColor in cssColors) {
      buffer.writeln('${cssColor.colorName}: ${toHex(cssColor.color)}');
    }
    SharePlus.instance.share(
      ShareParams(text: buffer.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.HomeScreenTitle),

        actions: [
          IconButton(
            onPressed: shareAll,
            icon: Icon(Icons.share),
          ),
        ],
      ),
      // body: ListView(
      //   children: [
      //     for (final cssColor in cssColors)
      //       CssColorListItem(cssColor: cssColor),
      //   ],
      body: ListView.builder(
        itemCount: cssColors.length,
        itemBuilder: (BuildContext context, int index) {
          return CssColorListItem(
            cssColor: cssColors[index],
            onItemClicked: () =>
                navigateTo(context, ColoredScreen(cssColor: cssColors[index])),
          );
        },
      ),
    );
  }
}
