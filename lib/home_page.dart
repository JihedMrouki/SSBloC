import 'package:flutter/material.dart';
import 'package:sharing_session_bloc/api_handling/UI/jokes_page.dart';
import 'package:sharing_session_bloc/validators/with_cubit/UI/input_validation_page_with_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DDD6),
      appBar: AppBar(
        title: const Text(
          'BloC Sharing Session',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const JokesPage(),
                    ),
                  );
                },
                child: const Text('API Handling Example'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InputValidationPageWithCubit(),
                  ),
                );
              },
              child: const Text('Input Validation Example'),
            ),
          ],
        ),
      ),
    );
  }
}
