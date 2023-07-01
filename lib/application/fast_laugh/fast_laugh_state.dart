part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Downloads> VideosList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;
  factory FastLaughState.initioal() => const FastLaughState(
        VideosList: [],
        isLoading: false,
        isError: false,
      );
}
