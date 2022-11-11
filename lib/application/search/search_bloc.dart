import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/home/i_home_repo.dart';
import 'package:netflix/domain/search/search_service.dart';

import '../../domain/home/models/home.dart';
import '../../domain/search/model/search_repo/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IHome _homeService;
  final SearchService _searchService;
  SearchBloc(this._homeService, this._searchService)
      : super(SearchState.initial()) {
    //  idle Search

    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));
      }
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));

      final _result = await _homeService.getTrendingImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Home> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      emit(_state);
    });

// search result

    on<SearchMovie>((event, emit) async {
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);

      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchRepo r) {
        return SearchState(
            searchResultList: r.results!,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      emit(_state);
      //  print(_result);
    });
  }
}
