import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_with_event/clean_arc_event/domain/entity/color_entity.dart';
import 'package:bloc_with_event/clean_arc_event/domain/usecase/color_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final ColorUseCase _useCase;
  ColorBloc(this._useCase) : super(ColorInitial()) {

    on<GetColors>(_onGetColors);

  }

  Future<void> _onGetColors(GetColors event, Emitter<ColorState> emit) async {

    try{
      emit( ColorLoading());
      var result = await _useCase.getColors();
      emit(ColorLoaded(result));
    }catch(e){
      emit(ColorError(e.toString()));
    }
  }
}
