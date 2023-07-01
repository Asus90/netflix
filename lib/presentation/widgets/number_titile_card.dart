import 'package:flutter/cupertino.dart';
import 'package:netflix/domain/hot_and_new_resp/model/hot_and_new_resp.dart';

import '../../core/constans.dart';
import 'main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.posterList,
  });
  final List<HoatAndNewData> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 TV Shows in India Today"),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterList.length,
                (index) => NumberCard(
                      movieName: posterList[index].originalName,
                      imageUrl:
                          '$ImageAppandUrl${posterList[index].posterPath}',
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
