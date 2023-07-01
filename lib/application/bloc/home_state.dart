part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required String stateId,
      required List<HoatAndNewData> pastYearMovieList,
      required List<HoatAndNewData> trandingMovieList,
      required List<HoatAndNewData> tenseDramasMovieList,
      required List<HoatAndNewData> sounthIndanMovieList,
      required List<HoatAndNewData> trandingTvList,
      required List<Result>? Upcomig,
      required bool isLoading,
      required bool isHomeLoading,
      required bool isHomeError,
      required bool hasError}) = _Initial;

  factory HomeState.initial() => const HomeState(
      stateId: '0',
      pastYearMovieList: [],
      trandingMovieList: [],
      tenseDramasMovieList: [],
      sounthIndanMovieList: [],
      trandingTvList: [],
      Upcomig: [],
      isLoading: false,
      isHomeError: false,
      isHomeLoading: false,
      hasError: false);
}
