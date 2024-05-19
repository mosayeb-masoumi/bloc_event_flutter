import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'title_event.dart';

part 'title_state.dart';

class TitleBloc extends Bloc<TitleEvent, TitleState> {
  TitleBloc() : super(const TitleInitial()) {

    on<UpdateTitle>(_onUpdateTitle);
    // on<UpdateDescription>(_onUpdateDescription);

  }

  Future<void> _onUpdateTitle(
      UpdateTitle event, Emitter<TitleState> emit) async {
    emit(const TitleLoading());
    await Future.delayed(const Duration(seconds: 2));
    var result = "my new title";
    emit(TitleLoaded(result));
  }

  // Future<void> _onUpdateDescription(
  //     UpdateDescription event, Emitter<TitleState> emit) async {
  //   try {
  //     emit(const DescriptionLoading());
  //     await Future.delayed(const Duration(seconds: 2));
  //     var result = "my new description";
  //     emit(DescriptionLoaded(result));
  //   } catch (e) {
  //     emit(DescriptionError(e.toString()));
  //   }
  // }
}
