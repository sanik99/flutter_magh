import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contants/gap_sizes.dart';



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appHeight = kToolbarHeight +2;
    final height = MediaQuery.of(context).size.height -MediaQuery.of(context).padding.top -appHeight;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(

      //backgroundColor: Color.fromRGBO(90, 100, 70,0.5),
      appBar: AppBar(
        elevation: 0,
        //leading: Text('hello'),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Hi John'),
        ),
        actions: [
       Icon(Icons.search),
        gapW10,
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(CupertinoIcons.airplane),
        )
        ],
      //  backgroundColor: Colors.black.withOpacity(1),
      ),
      body:

      Container(
     //   padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.black54),
          //borderRadius: BorderRadius.circular(20) ,
         // borderRadius:BorderRadius.only(topLeft: Radius.circular(20),),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: height * 0.25,
              width: 100,
              color: Colors.black54,
              child: Text('Hello1',style: TextStyle(fontSize: 20)),
            ),

            // Container(
            //   height: height * 0.25,
            //   width: 100,
            //   color: Colors.red,
            //   child: Text('Hello2',style: TextStyle(fontSize: 20)),
            // ),

            Expanded(

                child: Container(
                color: Colors.purple,
                child: Text('hello'))),

            // Container(
            //   height: height * 0.25,
            //   width: width * 0.5,
            //   color: Colors.purple,
            //   child: Text('Hello1',style: TextStyle(fontSize: 20)),
            // ),

            // Container(
            //   height: height * 0.25,
            //   width: 100,
            //   color: Colors.amber,
            //   child: Text('Hello1',style: TextStyle(fontSize: 20)),
            // )
          ],
        ),
      ),
    );
  }
}
