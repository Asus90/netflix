import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/presentation/fast_laugh/Widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(body: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text("Error while getting data"),
            );
          } else if (state.VideosList.isEmpty) {
            return const Text("video list empty");
          } else {
            return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.VideosList.length, (index) {
                  return videoListItemInheritedWidget(
                      key: Key(index.toString()),
                      widget: VideoListItem(index: index),
                      moviedata: state.VideosList[index]);
                }));
          }
        },
      )),
    );
  }
}
