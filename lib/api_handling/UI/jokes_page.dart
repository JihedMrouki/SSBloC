// source for free simple api's : https://apipheny.io/free-api/
// API : https://official-joke-api.appspot.com/random_joke

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharing_session_bloc/api_handling/bloc/joke_bloc.dart';

class JokesPage extends StatelessWidget {
  const JokesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DDD6),
      appBar: AppBar(
        title: const Text(
          'Joke Provider using Bloc',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => JokeBloc()..add(FectJokeEvent()),
        child: BlocBuilder<JokeBloc, JokeBlocState>(builder: (context, state) {
          if (state is JokeBlocInitialState) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is JokeFailedState) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text("Error Loading Jokes!"),
              ),
            );
          } else if (state is SuccessJokeState) {
            final jokesList = state.jokes[state.index];
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      jokesList.setup.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      jokesList.punchline.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(height: 70),
                    ElevatedButton(
                      onPressed: () {
                        context.read<JokeBloc>().add(NextJokeEvent());
                      },
                      child: const Text('Another one'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
