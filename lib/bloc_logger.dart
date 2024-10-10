import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker/talker.dart';

/// This class is manage bloc logging within the app
/// This class is made following the singleton design pattern
/// To use this class you need to make reference to the class name followed by the field [globalBlocLogger]
/// E.g : [GlobalBlocLogger.globalBlocLogger]

class GlobalBlocLogger extends BlocObserver {
  final logger = Talker();

  static final GlobalBlocLogger globalBlocLogger = GlobalBlocLogger._privateConstructor();

  GlobalBlocLogger._privateConstructor() ;

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.info(
        "${bloc.toString()} received a new event : ${event.toString()}  ");
    super.onEvent(bloc, event);
  }

  @override
  void onCreate(BlocBase bloc) {
    logger.good(
        "${DateTime.now()} | ${bloc.toString()} has been created successfully");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.good("${bloc.toString()} is closed");
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.error(
        "${bloc.toString()} has faced an error \n"
            "------------- ERROR -------------\n"
            "$error\n"
            "---------- Stack Trace ----------\n"
            "$stackTrace\n"
            "---------------------------------\n");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.info(
        "${bloc.toString()} updated state from event : ${transition.event}\n"
            "Current State: ${transition.currentState}\n"
            "Next state : ${transition.nextState}");
    super.onTransition(bloc, transition);
  }
}
