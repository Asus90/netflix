import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/mian_failure.dart';
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    on<LoadDataIncomingSoon>((event, emit) async {
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIswhatchingList: [],
          isLoading: true,
          hasError: false));

      final _result = await _hotAndNewService.getHotAndNewMovieData();

      final newState = _result.fold((MinFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIswhatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp rep) {
        return HotAndNewState(
            comingSoonList: rep.results,
            everyOneIswhatchingList: state.everyOneIswhatchingList,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });

    on<LoadDataInevEveryoneIswhatching>((event, emit) async {
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIswhatchingList: [],
          isLoading: true,
          hasError: false));

      final _result = await _hotAndNewService.getHotAndNewTvData();

      final newState = _result.fold((MinFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIswhatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp rep) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOneIswhatchingList: rep.results,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });
  }
}
