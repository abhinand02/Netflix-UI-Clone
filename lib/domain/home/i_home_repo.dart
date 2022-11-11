import 'package:dartz/dartz.dart';
import '../core/failure/main_failure.dart';
import 'models/home.dart';

abstract class IHome {
  Future<Either<MainFailure, List<Home>>> getTrendingImages();
}
