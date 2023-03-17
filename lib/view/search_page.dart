import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/serach_provider.dart';


class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
          builder: (context, ref, _) {
            final data = ref.watch(searchProvider);
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
               TextFormField(
                 controller: searchController,
                 onFieldSubmitted: (val){

                 },
                 decoration: InputDecoration(
                   hintText: 'search Movie',
                   border: OutlineInputBorder(),
                   contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                 ),
               ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.movies.length,
                        itemBuilder: (context, index){
                          return Container();
                        }
                    ),
                  )
                ],
              ),
            );
          }
        )
    );
  }
}
