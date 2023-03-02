import 'package:flutter/material.dart';
import 'package:sampleflutter/view/home_page.dart';



void main (){

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //
  //   )
  // );
runApp(Home());

}

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed:Colors.green
      ),
      
      home: HomePage(),
    );
  }
}






