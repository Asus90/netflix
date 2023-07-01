import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/domain/downloads/i_downloads_rep.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

ValueNotifier<Set<int>> likedVideoIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _idownloadsService,
  ) : super(FastLaughState.initioal()) {
    on<Initialize>((event, emit) async {
      if (state.VideosList.isNotEmpty) {
        emit(FastLaughState(
          VideosList: state.VideosList,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      emit(const FastLaughState(
        VideosList: [],
        isLoading: true,
        isError: false,
      ));
      // get tranding  movies
      final _result = await _idownloadsService.getDownloadsImage();

      final _state = _result.fold((l) {
        return FastLaughState(
          VideosList: [],
          isLoading: false,
          isError: true,
        );
      },
          (resp) => FastLaughState(
                VideosList: resp,
                isLoading: false,
                isError: false,
              ));
      // send to Ui
      emit(_state);
    });
    on<likedVideos>((event, emit) async {
      likedVideoIdsNotifier.value.add(event.id);
      likedVideoIdsNotifier.notifyListeners();
    });

    on<unlikedVieos>((event, emit) async {
      likedVideoIdsNotifier.value.remove(event.id);
      likedVideoIdsNotifier.notifyListeners();
    });
  }
}
