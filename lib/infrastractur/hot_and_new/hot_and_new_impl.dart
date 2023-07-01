import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failures/mian_failure.dart';
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import 'package:netflix/presentation/Home/model/home_model/home/home.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplmentation implements HotAndNewService {
  @override
  Future<Either<MinFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiENdPoints.hotAndNewMovie,
      );
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MinFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      return const Left(MinFailure.ClientFailure());
    }
  }

  @override
  Future<Either<MinFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiENdPoints.hotAndNewTv,
      );
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MinFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      return const Left(MinFailure.ClientFailure());
    }
  }

  @override
  Future<Either<MinFailure, Home>> getMainCardUpcomingDatas() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiENdPoints.upComingData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Home.fromJson(response.data);

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
