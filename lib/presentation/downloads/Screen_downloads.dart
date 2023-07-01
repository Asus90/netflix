import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final WidgetList = [
    _Smartdownloads(),
    Section2(),
    SEction3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) => WidgetList[index],
            separatorBuilder: (ctx, index) => SizedBox(
                  height: 25,
                ),
            itemCount: WidgetList.length),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvet.getDownloadsImage());
    });

    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you ",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We will download posonalised selection of\nmovies and shows for you,so there's\n is always something to watch on your\n divice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 53, 19, 244),
                        color: Color.fromARGB(255, 221, 7, 7),
                      ),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                              radius: size.width * 0.4,
                              backgroundColor: Colors.grey.withOpacity(0.5)),
                        ),
                        downloadsImageWidget(
                          movieList:
                              '$ImageAppandUrl${state.downloads?[0].posterpath}',
                          margin: EdgeInsets.only(
                            left: 160,
                          ),
                          angle: 25,
                          sizeOfimage: Size(
                            size.width * 0.35,
                            size.width * 0.55,
                          ),
                        ),
                        downloadsImageWidget(
                          movieList:
                              '$ImageAppandUrl${state.downloads?[1].posterpath}',
                          margin: EdgeInsets.only(
                            right: 160,
                          ),
                          angle: -25,
                          sizeOfimage:
                              Size(size.width * 0.35, size.width * 0.55),
                        ),
                        downloadsImageWidget(
                          movieList:
                              '$ImageAppandUrl${state.downloads?[2].posterpath}',
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          redius: 8,
                          sizeOfimage: Size(size.width * 0.4, size.width * 0.6),
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class SEction3 extends StatelessWidget {
  const SEction3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: KButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              "Seen what you can download",
              style: TextStyle(
                  color: KBloackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _Smartdownloads extends StatelessWidget {
  const _Smartdownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class downloadsImageWidget extends StatelessWidget {
  const downloadsImageWidget(
      {super.key,
      required this.movieList,
      this.angle = 0,
      required this.margin,
      this.redius = 10,
      required this.sizeOfimage});

  final String movieList;
  final double angle;
  final EdgeInsets margin;
  final Size sizeOfimage;
  final double redius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(redius),
          child: Container(
            width: sizeOfimage.width,
            height: sizeOfimage.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(movieList))),
          ),
        ),
      ),
    );
  }
}
