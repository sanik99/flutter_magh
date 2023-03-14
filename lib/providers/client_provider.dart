import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api.dart';







final clientProvider = Provider((ref){
  final options = BaseOptions(
    baseUrl: Api.baseUrl,
    // connectTimeout: Duration(seconds: 10),
    // receiveTimeout: Duration(seconds: 10),
  );

  return Dio(options);

});