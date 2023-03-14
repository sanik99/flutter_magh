import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
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
                    IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 30,))
                  ],
                ),
              ),

            ),
            bottom: TabBar(
                tabs: [
                  Tab()
                ]
            ),
          ),
          body: const Placeholder()),
    );
  }
}
