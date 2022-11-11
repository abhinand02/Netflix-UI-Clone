part of 'home_bloc.dart';

@freezed
class Homestate with _$Homestate {
  const factory Homestate({
    required bool isLoading,
    required bool hasError,
    required List<HotAndNewData> tvDramas,
    required List<HotAndNewData> top10,
    required List<HotAndNewData> trendingNow,
    required List<HotAndNewData> dramas,
    required List<HotAndNewData> tvShows,
  }) = _Homestate;

  factory Homestate.initial() {
    return const Homestate(
        isLoading: false, dramas: [], top10: [], trendingNow: [], tvDramas: [], tvShows: [], hasError: false);
  }
}
