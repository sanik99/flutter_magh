import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/api.dart';
import 'package:sampleflutter/contants/enums.dart';
import '../../contants/const_widgets.dart';
import '../../providers/movie_provider.dart';
import '../detail_page.dart';




class TabBarWidget extends StatelessWidget {
  final CategoryType categoryType;
  final String pageKey;
  const TabBarWidget({Key? key, required this.categoryType, required this.pageKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {

          final apiPath =  categoryType == CategoryType.Popular ? Api.popularMovie:
          categoryType == CategoryType.Upcoming ?Api.upComingMovie:
          Api.topRatedMovie;
          final movieData = ref.watch(movieProvider(apiPath));
           if(movieData.isLoad){
             return Center(child: CircularProgressIndicator());
           }else if(movieData.isError){
             return Center(child: Text(movieData.errMessage));
           }else{
             return Padding(
               padding: const EdgeInsets.all(10.0),
               child: NotificationListener(
                 onNotification: (ScrollEndNotification onNotification){
                   final before = onNotification.metrics.extentBefore;
                   final max = onNotification.metrics.maxScrollExtent;
                   if (before == max) {
                     ref.read(movieProvider(apiPath).notifier).loadMore();
                   }
                   return true;
                 },
                 child: GridView.builder(
                   key: PageStorageKey<String>(pageKey),
                   itemCount: movieData.movies.length,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 3,
                       childAspectRatio: 2/3,
                       crossAxisSpacing: 5,
                       mainAxisSpacing: 5
                     ),
                     itemBuilder: (context, index){
                     print(movieData.movies);
                       final movie = movieData.movies[index];
                       return  InkWell(
                         splashColor: Colors.pink,
                        onTap: (){
                      Get.to(() =>DetailPage(movie));
                        },
                         child: CachedNetworkImage(
                            imageUrl: movie.poster_path,
                           placeholder: (c, s) => spin
                         ),
                       );
                     }
                 ),
               ),
             );
           }
        }
    );
  }
}
