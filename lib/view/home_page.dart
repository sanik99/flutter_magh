import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/providers/samples/data_provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref, child) {
              final dat = ref.watch(dataProvider);
              return Container(
                  child: Center(
                      child:dat.when(
                          data: (data){
                            return Text(data.toString());
                          },
                          error: (err, stack) {

                            return Text('$err');
                          },
                          loading: () => CircularProgressIndicator()
                      )
                  )
              );
            }
    )
    );
  }
}
