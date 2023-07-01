import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:intl/intl.dart';
import 'package:netflix/presentation/widgets/cumstom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

import '../../core/constans.dart';
import '../widgets/app_bar_widget.dart';

class ScreenNewaAndHot extends StatelessWidget {
  const ScreenNewaAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: AppBar(
                title: const Text(
                  "New & Hot",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
                actions: [
                  const Icon(
                    Icons.cast,
                    color: Colors.white,
                    size: 30,
                  ),
                  kWidth,
                  Container(
                    width: 30,
                    height: 20,
                    color: Colors.blue,
                  ),
                  kWidth,
                ],
                bottom: TabBar(
                    onTap: (value) {
                      print(value);
                    },
                    unselectedLabelColor: kwhiteColor,
                    isScrollable: true,
                    labelColor: KBloackColor,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                        color: kwhiteColor, borderRadius: kRadius25),
                    tabs: [
                      Tab(
                        text: "🍿 Coming Soon",
                      ),
                      Tab(
                        text: "👀 Everyone's watching",
                      ),
                    ]),
              )),
          body: const TabBarView(children: [
            comingSoonList(
              key: Key('coming soon'),
            ),
            EveryOneIsWhatchingList(),
          ])),
    );
  }

  _BuildTabBarView(String name) {
    return Center(
      child: Text('$name'),
    );
  }
}

class comingSoonList extends StatelessWidget {
  const comingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataIncomingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataIncomingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error While is loading  comming soon list '),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  }
                  String month = '';
                  String date = '';

                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formatedDate
                        .split(" ")
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return ComingSoonWidget(
                    id: movie.id.toString(),
                    day: date,
                    month: month,
                    posterpath: '$ImageAppandUrl${movie.backdropPath}',
                    movieName: movie.originalTitle ?? 'no title',
                    description: movie.overview ?? 'no description',
                  );
                });
          }
        },
      ),
    );
  }
}

class EveryOneIsWhatchingList extends StatelessWidget {
  const EveryOneIsWhatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInevEveryoneIswhatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error While is loading  comming soon list '),
          );
        } else if (state.everyOneIswhatchingList.isEmpty) {
          return const Center(
            child: Text('List is Empty'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: state.everyOneIswhatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.everyOneIswhatchingList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  }
                  String month = '';
                  String date = '';

                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formatedDate
                        .split(" ")
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }
                  final tv = state.everyOneIswhatchingList[index];

                  return EveryonesWatchingWidget(
                      posterpath: '$ImageAppandUrl${tv.backdropPath}',
                      movieName: tv.originalName ?? "No movie name",
                      description: tv.overview ?? 'not description');
                }),
          );
        }
      },
    );
  }
}
