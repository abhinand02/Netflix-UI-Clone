


import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/hot_and_new_resp/model/hot_and_new_resp.dart';

abstract class HotAndNewService{
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();

  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();

  Future<Either<MainFailure,HotAndNewResp>> getTrendingData();

  Future<Either<MainFailure,HotAndNewResp>> getTop10Data();
  
}