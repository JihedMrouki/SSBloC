import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit() : super(ValidatorInitial());

  void validateInput(String input, dynamic state) {
    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
    );
    if (passwordRegex.hasMatch(input)) {
      emit(ValidatorValid());
    } else {
      emit(ValidatorInvalid());
    }
  }
}
