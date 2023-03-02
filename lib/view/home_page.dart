import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - kToolbarHeight;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

            AspectRatio(
                aspectRatio: 16/9,
              child: Container(
                color: Colors.green,
              ),
            ),

           Container(
             height: 500,
             width: 600,
             color: Colors.black12,
             child: LayoutBuilder(
                 builder: (context, constra){
                   return Column(
                     children: [
                       Container(
                         color: Colors.amber,
                         width: constra.maxWidth *  0.5,
                         height: constra.maxHeight * 0.5,
                         child: Text('hello'),
                       ),
                       Container(
                         color: Colors.black,
                         width: constra.maxWidth *  0.5,
                         height: constra.maxHeight * 0.5,
                         child: Text('hello'),
                       ),
                     ],
                   );
                 }
             ),
           ),
          ],
        )
    );
  }
}
