import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final dataProvider = FutureProvider((ref) => DataProvider.getData());


class DataProvider {

  static final  dio = Dio();
static   Future<int> getData() async{

    try{
      final response = await dio.get('https://api.themoviedb.org/3/movie/upcoming',
        queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8'
        }
      );
      return 90;
    }on DioError catch(err){
      print(err.type);
      print(err.response!.statusCode);
      return 90;
    }

  }
}