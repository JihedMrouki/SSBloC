part of 'joke_bloc.dart';

@immutable
sealed class JokeBlocState {}

final class JokeBlocInitialState extends JokeBlocState {}

class SuccessJokeState extends JokeBlocState {
  final List<Jokes> jokes;
  final int index;
  SuccessJokeState({
    required this.jokes,
    this.index = 0,
  });
}

class NextJokeState extends JokeBlocState {
  final int index;
  NextJokeState({
    required this.index,
  });
}

class JokeFailedState extends JokeBlocState {}
