part of 'joke_bloc.dart';

@immutable
sealed class JokeBlocEvent {}

class FectJokeEvent extends JokeBlocEvent {}

class NextJokeEvent extends JokeBlocEvent {}
