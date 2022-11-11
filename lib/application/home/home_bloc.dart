import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import '../../domain/core/failure/main_failure.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, Homestate> {
  // final IHome _homeRepo;
  final HotAndNewService _homeService;
  HomeBloc( this._homeService) : super(Homestate.initial()) {

    on<_getImages>((event, emit) async {
      if(state.top10.isNotEmpty){
        emit(Homestate(isLoading: false, hasError: false, tvDramas: state.tvDramas, top10: state.top10, trendingNow: state.trendingNow, dramas: state.dramas, tvShows: state.tvShows));
      }
      else{
        emit(state.copyWith(
        isLoading: true,
      ));

      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();
      final _trendingResult = await _homeService.getTrendingData();
      final _top10Result = await _homeService.getTop10Data();

      final state1 =_movieResult.fold((MainFailure failure) {
        return const Homestate(
            isLoading: false,
            tvDramas: [],
            top10: [],
            trendingNow: [],
            dramas: [],
            tvShows: [],
            hasError: true);
      }, (HotAndNewResp resp) {
        final movieList = resp.results;
        movieList.shuffle();
         return Homestate(
            isLoading: false,
            tvDramas: [],
            top10: state.top10,
            trendingNow: [],
            dramas: movieList,
            tvShows: [], 
            hasError: false,
            );
      });
      emit(state1);

      final state2 = _tvResult.fold((MainFailure failure) {
        const Homestate(
            isLoading: false,
            tvDramas: [],
            top10: [],
            trendingNow: [],
            dramas: [],
            tvShows: [],
            hasError: true);
      }, (HotAndNewResp resp) {
        final tvList = resp.results;
        final tvDrams = resp.results;
        tvDrams.shuffle();
        tvList.shuffle();
        return Homestate(
            isLoading: false,
            tvDramas: tvDrams,
            top10: state.top10,
            trendingNow: state.trendingNow,
            dramas: state.dramas,
            tvShows: tvList, 
            hasError: false,
            );
      });

emit(state2!);

   final state3 = _trendingResult.fold((MainFailure failure) {
         const Homestate(
            isLoading: false,
            tvDramas: [],
            top10: [],
            trendingNow: [],
            dramas: [],
            tvShows: [],
            hasError: true);
       }, (HotAndNewResp resp) {
        final top10 = resp.results;
        return Homestate(
            isLoading: false,
            tvDramas: state.tvDramas,
            top10: top10,
            trendingNow: resp.results ,
            dramas: state.dramas,
            tvShows: state.tvShows, 
            hasError: false,
            );
       });
       emit(state3!);
      

       final state4 = _top10Result.fold((MainFailure failure) {
         const Homestate(
            isLoading: false,
            tvDramas: [],
            top10: [],
            trendingNow: [],
            dramas: [],
            tvShows: [],
            hasError: true);
       }, (HotAndNewResp resp) {
        return Homestate(
            isLoading: false,
            tvDramas: state.tvDramas,
            top10: resp.results,
            trendingNow: state.trendingNow,
            dramas: state.dramas,
            tvShows: state.tvShows, 
            hasError: false,
            );
       });
      emit(state4!);
      }
      
      
    });


    
  }
}
