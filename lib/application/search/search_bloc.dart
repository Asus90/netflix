import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_rep.dart';
import 'package:netflix/domain/search/search_servise.dart';

import '../../domain/core/failures/mian_failure.dart';
import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/model/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsServise;
  final SearchService _searchService;
  SearchBloc(this._downloadsServise, this._searchService)
      : super((SearchState.initial())) {
    on<initialize>((event, emit) async {
      if (state.idlList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idlList: state.idlList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
          searchResultList: [], idlList: [], isLoading: true, isError: false));

      // get tranding
      final result = await _downloadsServise.getDownloadsImage();

      final _state = result.fold((MinFailure f) {
        return const SearchState(
          searchResultList: [],
          idlList: [],
          isLoading: false,
          isError: true,
        );
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idlList: list,
            isLoading: false,
            isError: false);
      });
      emit(_state);
    });

    on<searchMovies>((event, emit) async {
      // search movie Api

      emit(const SearchState(
          searchResultList: [], idlList: [], isLoading: false, isError: false));

      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MinFailure f) {
          return const SearchState(
            searchResultList: [],
            idlList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResponse r) {
          return SearchState(
              searchResultList: r.results,
              idlList: [],
              isLoading: false,
              isError: false);
        },
      );
      emit(_state);
    });
  }
}
