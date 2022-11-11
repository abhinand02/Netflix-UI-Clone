import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart';
import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService hotAndNewService;
  HotAndNewBloc(this.hotAndNewService) : super(HotAndNewState.initial()) {
    on<ComingSoon>((event, emit) async {
// send loading
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));

      final _result = await hotAndNewService.getHotAndNewMovieData();
    final newState =  _result.fold((l) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp r) {
        return HotAndNewState(
            comingSoonList: r.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false);
      });

      emit(newState);
    });

    on<EveryOneIsWatching>((event, emit) async{
       emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));

      final _result = await hotAndNewService.getHotAndNewTvData();
    final newState =  _result.fold((l) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp r) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchingList:  r.results,
            isLoading: false,
            hasError: false);
      });

      emit(newState);
    });
  }
}
