import 'dart:convert';

import 'package:sharing_session_bloc/api_handling/model/jokes.dart';
import 'package:sharing_session_bloc/api_handling/repository/http_connection.dart';

// API : https://official-joke-api.appspot.com/random_ten

class JokesRepo {
  DataProvider dataProvider = DataProvider();
  Future<List<Jokes>> getJokes() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://official-joke-api.appspot.com/random_ten");
      if (response.statusCode == 200) {
        List<dynamic> jokesList = json.decode(response.body); // Fix
        List<Jokes> jokes =
            jokesList.map((joke) => Jokes.fromJson(joke)).toList();
        return jokes;
      } else {
        throw "Error loading the joke!";
      }
    } catch (e) {
      rethrow;
    }
  }
}
