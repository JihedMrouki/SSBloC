import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharing_session_bloc/bloc_logger.dart';
import 'package:sharing_session_bloc/home_page.dart';

void main() {
  Bloc.observer = GlobalBlocLogger.globalBlocLogger;
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
