import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/core/debounce/debounce.dart';
import 'package:netflix/presentation/saerch/Widgets/search_idle.dart';
import 'package:netflix/presentation/saerch/Widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = DebouncerDuration(milliseconds: 1 * 100);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const initialize());
    });
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context).add(searchMovies(
                    movieQuery: value,
                  ));
                });
              },
            ),
            kheight,
            //  const Expanded(child:  SearchIdleWidget()),
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return SearchIdleWidget();
                } else {
                  return SearchResultWidget();
                }
              },
            )),
          ],
        ),
      )),
    );
  }
}
