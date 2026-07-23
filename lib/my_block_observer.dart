import 'dart:developer';

import 'package:bloc/bloc.dart';

class MyBlockObserver implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
     log(
      'STATE CHANGE -> ${bloc.runtimeType}\n'
      '${change.currentState} -> ${change.nextState}',
    );
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    log('CLOSE -> ${bloc.runtimeType}');
   
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    log('Created-> ${bloc.runtimeType}');
  }

  @override
  void onDone(
    Bloc<dynamic, dynamic> bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {

  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {

  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
   
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
   
  }
}
