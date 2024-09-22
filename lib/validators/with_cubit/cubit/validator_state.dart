part of 'validator_cubit.dart';

@immutable
abstract class ValidatorState {}

class ValidatorInitial extends ValidatorState {}
class ValidatorValid extends ValidatorState {}
class ValidatorInvalid extends ValidatorState {}
