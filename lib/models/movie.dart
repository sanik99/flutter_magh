




class MovieData{
  final MovieDates movieDates;
  final List<Movie> movie;
  MovieData({
    required this.movie,
    required this.movieDates
});
}


class MovieDates{
final String maximum;
final String minimum;

MovieDates({
  required this.maximum,
  required this.minimum
});

}

class Movie{
final String title;
final String backdrop_path;
final int id;
final String poster_path;
final String vote_average;
final  String overview;



Movie({
  required this.id,
  required this.title,
  required this.backdrop_path,
  required this.overview,
  required this.poster_path,
  required this.vote_average
});

factory Movie.fromJson(Map<String, dynamic> json){
  return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      backdrop_path: json['backdrop_path'] ?? '',
      overview: json['overview'],
      poster_path: json['poster_path'],
      vote_average: json['vote_average']
  );
}


}