import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/mian_failure.dart';
import 'package:netflix/domain/search/model/search_response/search_response.dart';
import 'package:netflix/domain/search/search_servise.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: SearchService)
class searchImpl implements SearchService {
  @override
  Future<Either<MinFailure, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiENdPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MinFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      return const Left(MinFailure.ClientFailure());
    }
  }
}
