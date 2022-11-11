part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Home> videoList,
    required bool isLoading,
    required bool idError,
  }) = _Initial;

  factory FastLaughState.initial() =>
      const FastLaughState(videoList: [], isLoading: true, idError: false);
}
