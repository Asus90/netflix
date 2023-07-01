import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/constans.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    required this.image,
    super.key,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Image.network(
            image,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return Center(
                  child: Icon(
                Icons.wifi,
                color: Colors.white,
              ));
            },
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kwhiteColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
