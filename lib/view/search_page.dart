import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../contants/const_widgets.dart';
import '../providers/serach_provider.dart';
import 'detail_page.dart';


class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Consumer(
            builder: (context, ref, _) {
              final data = ref.watch(searchProvider);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                 TextFormField(
                   controller: searchController,
                   onFieldSubmitted: (val){
                    ref.read(searchProvider.notifier).getSearch(val.trim());
                    searchController.clear();
                   },
                   decoration: InputDecoration(
                     hintText: 'search Movie',
                     border: OutlineInputBorder(),
                     contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                   ),
                 ),
                    Expanded(
                      child: data.isLoad ? Center(child: CircularProgressIndicator()) : data.isError ?
                     Center(child: Text(data.errMessage)): GridView.builder(
                                itemCount: data.movies.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 2/3,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5
                                ),
                                itemBuilder: (context, index) {
                                  final movie = data.movies[index];
                                  return InkWell(
                                    splashColor: Colors.pink,
                                    onTap: () {
                                      Get.to(() => DetailPage(movie));
                                    },
                                    child: CachedNetworkImage(
                                      errorWidget: (c,s,a) => Image.asset('assets/images/book.jpg'),
                                        imageUrl: movie.poster_path,
                                        placeholder: (c, s) => spin
                                    ),
                                  );
                                }


                    ))
                  ],
                ),
              );
            }
          ),
        )
    );
  }
}
