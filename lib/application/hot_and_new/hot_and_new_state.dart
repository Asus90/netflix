part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HoatAndNewData> comingSoonList,
    required List<HoatAndNewData> everyOneIswhatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
      comingSoonList: [],
      everyOneIswhatchingList: [],
      isLoading: false,
      hasError: false);
}
