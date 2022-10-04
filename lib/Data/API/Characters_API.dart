import 'package:dio/dio.dart';
import 'package:dloc_training/Strings.dart';

class CharactersAPI {
  late Dio dio;
  CharactersAPI() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
