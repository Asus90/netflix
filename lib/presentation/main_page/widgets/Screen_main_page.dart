import 'package:flutter/material.dart';

import 'package:netflix/presentation/Home/screen_home.dart';
import 'package:netflix/presentation/downloads/Screen_downloads.dart';
import 'package:netflix/presentation/downloads/widgets/bottom_nav.dart';
import 'package:netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/new_and_hot/Screen_new_and_hot.dart';
import 'package:netflix/presentation/saerch/screen_search.dart';

class ScreenMainpage extends StatelessWidget {
  ScreenMainpage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewaAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifire,
          builder: (context, index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomnavigationWidgets(),
    );
  }
}
