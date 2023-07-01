import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/mian_failure.dart';
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import 'package:netflix/presentation/Home/model/home_model/home/home.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<getHomeScreenData>((event, emit) async {
      emit(state.copyWith(isLoading: true, hasError: false));

      final _Movieresult = await _homeService.getHotAndNewMovieData();
      final _TvResult = await _homeService.getHotAndNewTvData();

      final _sate1 = _Movieresult.fold((MinFailure failure) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trandingMovieList: [],
            isHomeError: false,
            isHomeLoading: false,
            tenseDramasMovieList: [],
            sounthIndanMovieList: [],
            trandingTvList: [],
            Upcomig: [],
            isLoading: false,
            hasError: true);

        //
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final tranding = resp.results;
        final dramas = resp.results;
        final southIndan = resp.results;

        pastYear.shuffle();
        tranding.shuffle();
        dramas.shuffle();
        southIndan.shuffle();
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trandingMovieList: tranding,
            isHomeError: false,
            isHomeLoading: false,
            tenseDramasMovieList: dramas,
            sounthIndanMovieList: southIndan,
            trandingTvList: state.trandingMovieList,
            Upcomig: state.Upcomig,
            isLoading: false,
            hasError: false);
      });
      emit(_sate1);

      final _state2 = _TvResult.fold((MinFailure failure) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trandingMovieList: [],
            isHomeError: false,
            isHomeLoading: false,
            tenseDramasMovieList: [],
            sounthIndanMovieList: [],
            trandingTvList: [],
            Upcomig: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final top10List = resp.results;

        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            isHomeError: false,
            isHomeLoading: false,
            trandingMovieList: top10List,
            tenseDramasMovieList: state.tenseDramasMovieList,
            sounthIndanMovieList: state.sounthIndanMovieList,
            trandingTvList: top10List,
            Upcomig: state.Upcomig,
            isLoading: false,
            hasError: false);
      });
      emit(_state2);

      final _Upcoming = await _homeService.getMainCardUpcomingDatas();
      final _state3 = _Upcoming.fold((MinFailure l) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trandingMovieList: [],
            tenseDramasMovieList: [],
            sounthIndanMovieList: [],
            trandingTvList: [],
            Upcomig: [],
            isLoading: false,
            isHomeLoading: false,
            isHomeError: true,
            hasError: false);
      }, (Home r) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trandingMovieList: state.trandingMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            Upcomig: r.results,
            sounthIndanMovieList: state.sounthIndanMovieList,
            trandingTvList: state.trandingTvList,
            isLoading: false,
            isHomeLoading: false,
            isHomeError: false,
            hasError: false);
      });

      emit(_state3);
    });
  }
}
