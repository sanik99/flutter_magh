import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api.dart';
import '../models/movie.dart';
import '../providers/client_provider.dart';





final movieService = Provider((ref) => MovieService(ref.watch(clientProvider)));


class MovieService {

final Dio _dio;
MovieService(this._dio);


     Future<Either<String, List<Movie>>> getData({required String apiPath, required int page}) async{
    try{
      final response = await _dio.get(apiPath,
          queryParameters: {
            'api_key': Api.apiKey,
            'page': page
          }
      );
      final extractData = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return Right(extractData);

    }on DioError catch(err, stack){
      return Left(err.toString());
    }

  }






}