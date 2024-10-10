import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharing_session_bloc/api_handling/model/jokes.dart';
import 'package:sharing_session_bloc/api_handling/repository/jokes_repo.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeBlocEvent, JokeBlocState> {
  int index = 0;
  List<Jokes> jokes = [];

  JokeBloc() : super(JokeBlocInitialState()) {
    on<FectJokeEvent>(
      (event, emit) async {
        try {
          jokes = await JokesRepo().getJokes();
          emit(
            SuccessJokeState(jokes: jokes, index: index),
          );
        } catch (e) {
          emit(JokeFailedState());
          rethrow;
        }
      },
    );
    on<NextJokeEvent>(
      (event, emit) async {
        if (index < jokes.length - 1) {
          index++;
        }
        emit(SuccessJokeState(jokes: jokes, index: index));
      },
    );
  }
}
