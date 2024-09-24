import 'package:flutter/material.dart';
import 'package:sharing_session_bloc/home_page.dart';
import 'package:sharing_session_bloc/validators/with_cubit/UI/input_validation_page_with_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloC Sharing Session',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: Colors.deepPurple,
          )),
      home: const HomePage(),
    );
  }
}
