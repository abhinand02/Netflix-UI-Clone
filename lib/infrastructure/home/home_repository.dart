import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/home/i_home_repo.dart';
import 'package:netflix/domain/home/models/home.dart';

@LazySingleton(as: IHome)
class HomeRepository implements IHome {
  @override
  Future<Either<MainFailure, List<Home>>> getTrendingImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPointss.trending);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Home> homeList = (response.data['results'] as List)
            .map((e) => Home.fromJson(e))
            .toList();

        return Right(homeList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
