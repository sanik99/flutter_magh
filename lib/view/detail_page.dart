import 'package:flutter/material.dart';
import 'package:sampleflutter/contants/gap_sizes.dart';

import '../models/book.dart';



class DetailPage extends StatelessWidget {
final Book book;

  // const DetailPage({required this.book,Key? key}) : super(key: key);
DetailPage(this.book);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            child: Column(
          children: [

         Image.network(book.imageUrl, height: 370, width: double.infinity, fit: BoxFit.fill,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(book.title),
                      Column(
                        children: [
                          Text(book.rating),
                          Text(book.genre)
                        ],
                      )
                    ],
                  ),
                  gapH12,
                  Text(book.detail),
                  gapH12,
                  gapH12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                 ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       minimumSize: Size(150, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      // foregroundColor: Colors.black,
                       backgroundColor: Color(0xFF007084)
                     ),
                     onPressed: (){}, child: Text('Read Book')),

                 OutlinedButton(
                     style: OutlinedButton.styleFrom(
                         minimumSize: Size(150, 40),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20)
                         ),
                     ),
                     onPressed: (){}, child: Text('More Book')),
                    ],
                  ),

                ],
              ),
            ),

          ],
        ))
    );
  }
}
