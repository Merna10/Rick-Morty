import 'package:dio/dio.dart';
import 'package:rickandmorty/constants/strings.dart';

class CharacterWebServices {
  late Dio dio;
  
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('/character'); // Update the endpoint
      print(response.data.toString());
      return response.data['results']; // Adjust as per the API response structure
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
