import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/endpoint/endpoint.dart';
import '../DataProvider/mydio.dart';
import '../Response/Movies_popular_response.dart';

class MoviesResquest{
  Future moviesrequest({
    required String apiKey
})async{
 try{
   Response response =await MyDio.getData(
       endPoint: popularMovies,
       query: {
        'api_key': apiKey,

      });


   return MoviesPopularResponse.fromJson(response.data);
 }catch(error){
   if (kDebugMode) {
     print(error);
   }
 }
}
}