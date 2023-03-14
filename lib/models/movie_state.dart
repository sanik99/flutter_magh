import 'movie.dart';




class MovieState{

 final bool isError;
 final bool isSuccess;
 final String errMessage;
 final bool isLoad;
 final List<Movie> movies;


 MovieState({
   required this.errMessage,
   required this.isSuccess,
   required this.isError,
   required this.movies,
   required this.isLoad
});

 MovieState copyWith ({
   bool? isError,
   bool? isSuccess,
   String? errMessage,
   List<Movie>? movies,
   bool? isLoad
}){
   return MovieState(
       errMessage: errMessage ?? this.errMessage,
       isSuccess: isSuccess ?? this.isSuccess,
       isError: isError ?? this.isError,
       movies: movies ?? this.movies,
       isLoad: isLoad ?? this.isLoad
   );
 }

factory MovieState.empty(){
   return MovieState(errMessage: '', isSuccess: false, isError: false, movies: [], isLoad: false);
}


}


