import 'package:netflix/core/strings.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/infrastractur/api_key.dart';

class ApiENdPoints {
  static const downloads =
      "$KBaseUrl/trending/all/day?language=en-US&api_key=$apiKey";
  static const search = '$KBaseUrl/search/movie?api_key=$apiKey';
  static const hotAndNewMovie =
      '$KBaseUrl/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=$apiKey';

  static const hotAndNewTv =
      '$KBaseUrl/discover/tv?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=$apiKey';
  static const upComingData =
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=ad798de9de81bdf202e372c0d9961d95';
}
