
import 'package:bloc_with_event/clean_arc_event/presentation/bloc/color_bloc.dart';
import 'package:get_it/get_it.dart';

import 'clean_arc_event/data/data_source/color_data_source.dart';
import 'clean_arc_event/data/repository_impl/color_repository_impl.dart';
import 'clean_arc_event/domain/repository/color_repository.dart';
import 'clean_arc_event/domain/usecase/color_use_case.dart';

final di = GetIt.instance;

void setUpDI() {

  // color_screen
  di.registerLazySingleton<ColorDataSource>(() => IColorDataSource());
  di.registerLazySingleton<ColorRepository>(() => ColorRepositoryImpl(di()));
  di.registerLazySingleton<ColorUseCase>(() => ColorUseCase(di()));
  di.registerLazySingleton<ColorBloc>(() => ColorBloc(di()));

}