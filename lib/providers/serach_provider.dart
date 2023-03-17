import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/models/search_state.dart';
import 'package:sampleflutter/services/movie_service.dart';



final searchProvider = StateNotifierProvider<SearchProvider, SearchState>(
        (ref, ) => SearchProvider(SearchState.empty(),
        ref.watch(movieService)));

class SearchProvider extends StateNotifier<SearchState>{
  final MovieService service;

  SearchProvider(super.state, this.service);

  Future<void> getSearch(String query) async{
    state = state.copyWith(errMessage: '', isSuccess: false, isError: false,  isLoad: true);
    final response = await service.searchMovie(query);
    response.fold((l) {
      state = state.copyWith(errMessage: l, isSuccess: false, isError: true, movies: [], isLoad: false);
    }, (r) {
      state = state.copyWith(errMessage: '', isSuccess: true, isError: false, movies: [...state.movies, ...r], isLoad: false);
    });
  }



}