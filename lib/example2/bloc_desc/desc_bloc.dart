import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'desc_event.dart';
part 'desc_state.dart';

class DescBloc extends Bloc<DescEvent, DescState> {
  DescBloc() : super(const DescriptionInitial()) {

    on<UpdateDescription>(_onUpdateDescription);
  }


  Future<void> _onUpdateDescription(
      UpdateDescription event, Emitter<DescState> emit) async {
    try {
      emit(const DescriptionLoading());
      await Future.delayed(const Duration(seconds: 2));
      var result = "my new description";
      emit(DescriptionLoaded(result));
    } catch (e) {
      emit(DescriptionError(e.toString()));
    }
  }
}
