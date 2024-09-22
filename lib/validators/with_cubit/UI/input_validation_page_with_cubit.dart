import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/validator_cubit.dart';

class InputValidationPageWithCubit extends StatelessWidget {
  const InputValidationPageWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input validation using cubit'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ValidatorCubit(),
        child: BlocBuilder<ValidatorCubit, ValidatorState>(
          builder: (context, state) {
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
                              : Colors.yellow,
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
