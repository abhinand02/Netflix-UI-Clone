import 'package:netflix/constants/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPointss {
  static const trending = "$baseUrl/trending/all/day?api_key=$apiKey";

  static const search = '$baseUrl/search/movie?api_key=$apiKey';

  static const hotAndNewMovie = '$baseUrl/discover/movie?api_key=$apiKey';

  static const hotAndNewTv = '$baseUrl/discover/tv?api_key=$apiKey';

  static const top10 = '$baseUrl/movie/top_rated?api_key=$apiKey';
}
