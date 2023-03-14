import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/models/movie_state.dart';
import 'package:sampleflutter/services/movie_service.dart';



final movieProvider = StateNotifierProvider.autoDispose<MovieProvider, MovieState>((ref) => MovieProvider(MovieState.empty(),
    ref.watch(movieService)));

class MovieProvider extends StateNotifier<MovieState>{
  final MovieService service;
  MovieProvider(super.state, this.service);


  Future<void> getData({required String apiPath, required int page}) async{
    state = state.copyWith(errMessage: '', isSuccess: false, isError: false, movies: [], isLoad: true);
       final response = await service.getData(apiPath: apiPath, page: page);
       response.fold((l) {
         state = state.copyWith(errMessage: l, isSuccess: false, isError: true, movies: [], isLoad: false);
       }, (r) {
         state = state.copyWith(errMessage: '', isSuccess: true, isError: false, movies: r, isLoad: false);
       });
  }

}