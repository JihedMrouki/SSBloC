part of 'joke_bloc.dart';


sealed class JokeBlocEvent {}

class FectJokeEvent extends JokeBlocEvent {}

class NextJokeEvent extends JokeBlocEvent {}
