import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/application/bloc/home_bloc.dart';

import 'package:netflix/core/constans.dart';

import 'package:netflix/presentation/widgets/background_card.dart';

import '../widgets/main_titile_card.dart';
import '../widgets/number_titile_card.dart';

ValueNotifier<bool> scrollNotofier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getHomeScreenData());
    });
    return Padding(
      padding: EdgeInsets.all(10),
      child: Scaffold(
          body: ValueListenableBuilder(
        valueListenable: scrollNotofier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (Notification) {
              final ScrollDirection direction = Notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotofier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotofier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    final bakcCard = state.Upcomig!;
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (state.hasError) {
                      print("errog while loading");
                      return const Center(
                        child: Text(
                          "Error While loading data",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
// released past
                    final _releasdPastYear = state.pastYearMovieList.map((m) {
                      return '$ImageAppandUrl${m.posterPath}';
                    }).toList();
                    _releasdPastYear.shuffle();

                    // tranding

                    final _tranding = state.trandingMovieList.map((m) {
                      return '$ImageAppandUrl${m.posterPath}';
                    }).toList();
                    _tranding.shuffle();

                    // tensDramas
                    final _tensDramas = state.tenseDramasMovieList.map((m) {
                      return '$ImageAppandUrl${m.posterPath}';
                    }).toList();
                    _tensDramas.shuffle();
                    // sounthIndainMovies

                    final _southIndianMovies =
                        state.sounthIndanMovieList.map((m) {
                      return '$ImageAppandUrl${m.posterPath}';
                    }).toList();
                    _southIndianMovies.shuffle();
                    // Top10TvSHows

                    // final _top10TvShows = state.trandingTvList.map((m) {
                    //   return '$ImageAppandUrl${m.posterPath}';
                    // }).toList();
                    _southIndianMovies.shuffle();
                    Random random = Random();
                    int randomNumber = random.nextInt(11);

                    return ListView(
                      children: [
                        if (bakcCard.isNotEmpty)
                          BackgroundCard(
                            imageUrl: bakcCard,
                            index: randomNumber,
                          )
                        else
                          const SizedBox(height: 100),

                        MainTitleCard(
                          title: 'Released in the past year',
                          posterList: _releasdPastYear,
                        ),
                        kheight,
                        MainTitleCard(
                          title: 'Tranding Now',
                          posterList: _tranding,
                        ),
                        kheight,
                        // Top 10 movies
                        NumberTitleCard(posterList: state.trandingTvList),
                        kheight,
                        // top 10 movies
                        MainTitleCard(
                          posterList: _tensDramas,
                          title: 'Tense Dramas',
                        ),
                        kheight,
                        MainTitleCard(
                          posterList: _southIndianMovies,
                          title: 'South Indian Cinema',
                        ),
                        kheight,
                      ],
                    );
                  },
                ),
                scrollNotofier.value == true
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png",
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: KHomeTitleText,
                                ),
                                Text(
                                  "Movies",
                                  style: KHomeTitleText,
                                ),
                                Text(
                                  "Categories",
                                  style: KHomeTitleText,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight
              ],
            ),
          );
        },
      )),
    );
  }
}
