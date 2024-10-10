import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/validator_cubit.dart';

class InputValidationPageWithCubit extends StatelessWidget {
  const InputValidationPageWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DDD6),
      appBar: AppBar(
        title: const Text(
          'Input validation using cubit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ValidatorCubit(),
        child: BlocBuilder<ValidatorCubit, ValidatorState>(
          buildWhen: (previous, current) {
            return (previous is ValidatorInvalid &&
                    current is ValidatorValid) ||
                (previous is ValidatorValid && current is ValidatorInvalid) ||
                previous is ValidatorInitial;
          },
          builder: (context, state) {
            print("FEL BUILDER --------------------");
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1.5,
                      color: state is ValidatorValid
                          ? Colors.green
                          : state is ValidatorInvalid
                              ? Colors.red
                              : const Color(0xFF918983),
                    )),
                    child: TextField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                      ),
                      onChanged: (value) {
                        context
                            .read<ValidatorCubit>()
                            .validateInput(value, state);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
