import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharing_session_bloc/api_handling/model/jokes.dart';
import 'package:sharing_session_bloc/api_handling/repository/jokes_repo.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeBlocEvent, JokeBlocState> {
  JokeBloc() : super(JokeBlocInitialState()) {
    on<FectJokeEvent>(
      (event, emit) async {
        try {
          final jokes = await JokesRepo().getJokes();
          emit(
            SuccessJokeState(jokes: jokes),
          );
        } catch (e) {
          emit(JokeFailedState());
        }
      },
    );
    on<NextJokeEvent>(
      (event, emit) async {
        const index = 0;
        emit(NextJokeState(index: index + 1));
      },
    );
  }
}
