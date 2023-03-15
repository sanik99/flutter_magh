import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/api.dart';
import 'package:sampleflutter/contants/enums.dart';
import '../../providers/movie_provider.dart';



class TabBarWidget extends StatelessWidget {
  final CategoryType categoryType;
  final String pageKey;
  const TabBarWidget({Key? key, required this.categoryType, required this.pageKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          final movieData = ref.watch(movieProvider(
          categoryType == CategoryType.Popular ? Api.popularMovie:
              categoryType == CategoryType.Upcoming ?Api.unComingMovie:
                  Api.topRatedMovie
          ));
           if(movieData.isLoad){
             return Center(child: CircularProgressIndicator());
           }else if(movieData.isError){
             return Center(child: Text(movieData.errMessage));
           }else{
             return GridView.builder(
               key: PageStorageKey<String>(pageKey),
               itemCount: movieData.movies.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                   childAspectRatio: 2/3,
                   crossAxisSpacing: 5,
                   mainAxisSpacing: 5
                 ),
                 itemBuilder: (context, index){
                   final movie = movieData.movies[index];
                   return  Image.network(movie.poster_path);
                 }
             );
           }
        }
    );
  }
}
