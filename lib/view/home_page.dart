import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/view/search_page.dart';
import 'package:sampleflutter/view/widgets/tab_bar_widget.dart';

import '../contants/enums.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 77,
            elevation: 0,
            flexibleSpace: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Watch Now', style: TextStyle(fontSize: 25, color: Colors.white),),
                    IconButton(onPressed: (){
                      Get.to(() => SearchPage());
                    }, icon: Icon(Icons.search, size: 30,))
                  ],
                ),
              ),

            ),
            bottom: TabBar(

                tabs: [
                  Tab(
                    text: CategoryType.Popular.name,
                  ),
                  Tab(
                    text: CategoryType.Top_Rated.name,
                  ),
                  Tab(
                    text: CategoryType.Upcoming.name,
                  ),
                ]
            ),
          ),
          body: TabBarView(
            children: [
           TabBarWidget(categoryType: CategoryType.Popular, pageKey: 'popular'),
           TabBarWidget(categoryType: CategoryType.Top_Rated, pageKey: 'top'),
           TabBarWidget(categoryType: CategoryType.Upcoming, pageKey: 'upcoming',),
              ],)
      ),
    );
  }
}
