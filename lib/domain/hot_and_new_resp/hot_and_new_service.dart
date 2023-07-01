import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/mian_failure.dart';
import 'package:netflix/domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import 'package:netflix/presentation/Home/model/home_model/home/home.dart';

abstract class HotAndNewService {
  Future<Either<MinFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MinFailure, HotAndNewResp>> getHotAndNewTvData();
  Future<Either<MinFailure, Home>> getMainCardUpcomingDatas();
}
