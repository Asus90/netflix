import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/Home/model/home_model/home/home.dart';

import '../../core/colors/colors.dart';
import '../../core/constans.dart';
import 'cumstom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  final List<Result> imageUrl;
  final int index;

  const BackgroundCard({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final tile = imageUrl[index].originalTitle;

    return Stack(
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Text(
            tile!,
            style: TextStyle(
                fontFamily: AutofillHints.countryName,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        )),
        Container(
          width: double.infinity,
          height: 600,
          child: imageUrl.isNotEmpty
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "$ImageAppandUrl${imageUrl[index].backdropPath}"),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(icon: Icons.add, title: "My List"),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: "Info"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kwhiteColor)),
        onPressed: () {},
        icon: const Icon(Icons.play_arrow, size: 25, color: KBloackColor),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: KBloackColor),
          ),
        ));
  }
}
