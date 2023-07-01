import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constans.dart';
import '../../widgets/cumstom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterpath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget(
      {super.key,
      required this.posterpath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: KGrayColor),
        ),
        kheight50,
        VideoWidget(image: posterpath),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
                iconSize: 25, TextSize: 16, icon: Icons.share, title: "Share"),
            kWidth,
            CustomButtonWidget(
                iconSize: 25, TextSize: 16, icon: Icons.add, title: "My List"),
            kWidth,
            CustomButtonWidget(
                iconSize: 25,
                TextSize: 16,
                icon: Icons.play_arrow,
                title: "Play"),
            kWidth
          ],
        )
      ],
    );
  }
}
