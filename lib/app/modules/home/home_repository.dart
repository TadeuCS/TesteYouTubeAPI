import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeRepository {
  Dio dio;
  HomeRepository(this.dio);

  Future<Response> searchByText(String searchText,
      {int maxResult, String pageToken}) async {
    try {
      searchText = searchText.toUpperCase().replaceAll('LIVE', '');
      dio.options.queryParameters = Map.from({
        'key': env['API_KEY'],
        'part': 'snippet',
        'maxResults': maxResult ?? 10,
        'q': 'Live $searchText',
        // 'order': 'date'
      });

      if (pageToken.isNotEmpty) {
        dio.options.queryParameters.addAll(Map.from({'pageToken': pageToken}));
      }

      return dio.get('/v3/search');
    } catch (e) {
      throw e;
    }
  }
}
