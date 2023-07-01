import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constans.dart';
import '../../widgets/cumstom_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size sizeOfscreen = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 16, color: KGrayColor),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              ),
            ],
          ),
        ),
        SizedBox(
          width: sizeOfscreen.width - 50,
          height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: posterpath),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          // letterSpacing: -7,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Row(
                    children: [
                      CustomButtonWidget(
                          iconSize: 20,
                          TextSize: 12,
                          icon: Icons.notifications,
                          title: "Remind me"),
                      kWidth,
                      CustomButtonWidget(
                          iconSize: 20,
                          TextSize: 12,
                          icon: Icons.info,
                          title: "Info"),
                      kWidth
                    ],
                  )
                ],
              ),
              kheight,
              Text("Coming on $day$month "),
              kheight,
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                movieName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(description,
                  maxLines: 4, style: const TextStyle(color: KGrayColor))
            ],
          ),
        ),
      ],
    );
  }
}
