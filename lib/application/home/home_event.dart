part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  // const factory HomeEvent.getTrendingImages() = _getTrendingImages;
  const factory HomeEvent.getImages() = _getImages;
}
