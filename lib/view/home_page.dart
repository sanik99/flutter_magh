import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/contants/gap_sizes.dart';
import 'package:sampleflutter/models/book.dart';
import 'package:sampleflutter/view/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hi John,'),
          actions: [],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: _buildCachedNetworkImage(imageUrl: 'https://images.unsplash.com/photo-1589998059171-988d887df646?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfDB8MHx8&auto=format&fit=crop&w=400&q=60'),
            ),
            gapH12,

            //
            // Container(
            //   color: Colors.black12,
            //   height: 300,
            //   child: Stack(
            //     children: [
            //      Image.network(books[0].imageUrl),
            //       Positioned(
            //           bottom: 0,
            //           right: 0,
            //
            //           child: Text('hello world', style: TextStyle(color: Colors.black, fontSize: 50),))
            //     ],
            //   ),
            // )



            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return InkWell(
                      onTap: (){
                    Get.to(() =>  DetailPage(book), transition: Transition.leftToRight);
                      },

                      child: Container(
                          margin: EdgeInsets.only(
                              right: 10, left: index == 0 ? 10 : 0),
                          width: 370,
                          child: Stack(

                            children: [
                              Positioned(
                                bottom: 0,
                                child: Card(
                                  child: Container(
                                    width: 370,
                                    padding: EdgeInsets.only(left: 10,),
                                    height: 200,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 150,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(book.title),
                                              Text(book.detail, maxLines: 3,),
                                              Row(
                                                children: [
                                                  Text(book.rating),
                                                  Spacer(),
                                                  TextButton(
                                                    onPressed: (){},
                                                    child: Text(book.genre),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: _buildCachedNetworkImage(
                                      width: 150,
                                      height: 250,
                                      imageUrl: book.imageUrl),
                                ),
                              ),



                            ],
                          )),
                    );
                  }),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('You may also like',
                      style: TextStyle(fontSize: 17,
                          fontWeight: FontWeight.w700,color: Colors.grey.shade700,
                          letterSpacing: 1),),
                  ),
                ],
              ),
            ),



            Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Container(
                        margin: EdgeInsets.only(
                            right: 10, left: index == 0 ? 10 : 0),
                        width: 170,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: _buildCachedNetworkImage(
                                  width: 150,
                                  height: 250,
                                  imageUrl: book.imageUrl),
                            ),
                            Container(
                                child: Text(
                                    book.title.length > 20 ? book.title.substring(0, 20) : book.title,
                                maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ))
                          ],
                        ));
                  }),
            ),







          ],
        ));
  }

  CachedNetworkImage _buildCachedNetworkImage({required String imageUrl, double? width, double? height}) {
    return CachedNetworkImage(
      imageUrl:imageUrl,
      height: height,
      width: width,
      placeholderFadeInDuration: Duration(milliseconds: 50),
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset('assets/images/book.jpg'),
      fit: BoxFit.cover,
    );
  }
}
