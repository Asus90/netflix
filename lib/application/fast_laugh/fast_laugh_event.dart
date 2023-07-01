part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  const factory FastLaughEvent.likedVideos({required int id}) = likedVideos;
  const factory FastLaughEvent.unlikedVieos({required int id}) = unlikedVieos;
}
