import 'package:dartz/dartz.dart';
import 'package:netflix/domain/search/model/search_response/search_response.dart';

import '../core/failures/mian_failure.dart';

abstract class SearchService {
  Future<Either<MinFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
