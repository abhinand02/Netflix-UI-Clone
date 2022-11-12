import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/home/i_home_repo.dart';

import '../../domain/home/models/home.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IHome homeService,
  ) : super(FastLaughState.initial()) {
    on<FastLaughEvent>((event, emit) async {
      //sending Loading to UI
      emit(
          const FastLaughState(videoList: [], isLoading: true, idError: false));

      //get trending movies
      final _result = await homeService.getTrendingImages();
      final _state = _result.fold((MainFailure f) {
        return const FastLaughState(
            videoList: [], isLoading: false, idError: true);
      }, (r) {
        return FastLaughState(videoList: r, isLoading: false, idError: false);
      });
      // send to ui

      emit(_state);
    });
  }
}
