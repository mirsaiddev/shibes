import 'package:dio/dio.dart';
import 'package:shibas_mvvm_provider/models/shibe.dart';
import 'package:shibas_mvvm_provider/utils/constants.dart';

class WebService {
  var dio = Dio();

  Future<List<Shibe>> fetchShibes() async {
    String url = Constants.API_URL;

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final List result = response.data;
      Iterable list = result;
      return list.map((shibe) => Shibe(imageUrl: shibe)).toList();
    } else {
      throw Exception("Failed  to get data");
    }
  }
}
