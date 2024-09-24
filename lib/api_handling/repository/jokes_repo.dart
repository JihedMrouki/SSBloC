import 'package:sharing_session_bloc/api_handling/model/jokes.dart';
import 'package:sharing_session_bloc/api_handling/repository/http_connection.dart';

class ProductRepository {
  DataProvider dataProvider = DataProvider();
  Future<List<Jokes>> getJokes() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://official-joke-api.appspot.com/random_ten");
      if (response.statusCode == 200) {
        List<Jokes> jokes = Jokes.fromJson(response.body) as List<Jokes>;
        return jokes;
      } else {
        throw "Error loading the joke!";
      }
    } catch (e) {
      rethrow;
    }
  }
}
