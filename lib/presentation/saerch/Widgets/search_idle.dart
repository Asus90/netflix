import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/saerch/Widgets/title.dart';

import '../../../core/constans.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Top searches"),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              } else if (state.idlList.isEmpty) {
                return const Center(
                  child: Text("Movie list is empty"),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idlList[index];
                    return TopSearchItemTile(
                        ImageUrl: '$ImageAppandUrl${movie.posterpath}',
                        title: movie.title ?? 'no title');
                  },
                  separatorBuilder: (ctx, index) => kheight20,
                  itemCount: state.idlList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String ImageUrl;
  const TopSearchItemTile(
      {super.key, required this.ImageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(ImageUrl),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: KBloackColor,
            radius: 18,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
