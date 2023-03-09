import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/providers/counter_provider.dart';
import 'package:sampleflutter/view/home_page.dart';



void main (){

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //
  //   )
  // );
runApp(ProviderScope(child: Home()));

}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}


class Counter extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final number = ref.watch(counterProvider).number;
            final n = ref.watch(counterState);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$n', style: TextStyle(fontSize: 30),),
                    Text('${n%2==0 ? 'even': 'odd'} ', style: TextStyle(fontSize: 30),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                    //  ref.read(counterProvider).increment();
                      ref.read(counterState.notifier).state++;
                    },
                        child: Text(
                          'increment', style: TextStyle(fontSize: 25),)),
                    TextButton(onPressed: () {
                      ref.read(counterProvider).decrement();
                    }, child: Text('decrement', style: TextStyle(fontSize: 25),)
                    ),
                  ],
                )
              ],
            );
          }
        )
    );
  }
}






