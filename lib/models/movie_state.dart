import 'movie.dart';




class MovieState{

 final bool isError;
 final bool isSuccess;
 final String errMessage;
 final bool isLoad;
 final List<Movie> movies;
 final int page;
 final bool isLoadMore;


 MovieState({
   required this.errMessage,
   required this.isSuccess,
   required this.isError,
   required this.movies,
   required this.isLoad,
   required this.page,
   required this.isLoadMore
});

 MovieState copyWith ({
   bool? isError,
   bool? isSuccess,
   String? errMessage,
   List<Movie>? movies,
   bool? isLoad,
   int? page,
   bool? isLoadMore
}){
   return MovieState(
       errMessage: errMessage ?? this.errMessage,
       isSuccess: isSuccess ?? this.isSuccess,
       isError: isError ?? this.isError,
       movies: movies ?? this.movies,
       isLoad: isLoad ?? this.isLoad,
     page: page ?? this.page,
     isLoadMore: isLoadMore ?? this.isLoadMore
   );
 }

factory MovieState.empty(){
   return MovieState(errMessage: '', isSuccess: false, isError: false, movies: [], isLoad: false, page: 1, isLoadMore: false);
}


}


