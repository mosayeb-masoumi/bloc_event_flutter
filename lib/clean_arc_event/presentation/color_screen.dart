import 'package:bloc_with_event/clean_arc_event/domain/entity/color_entity.dart';
import 'package:bloc_with_event/clean_arc_event/presentation/bloc/color_bloc.dart';
import 'package:bloc_with_event/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(di()),
        ),
      ],
      child: const IColorScreen(),
    );
  }
}

class IColorScreen extends StatefulWidget {
  const IColorScreen({super.key});

  @override
  State<IColorScreen> createState() => _IColorScreenState();
}

class _IColorScreenState extends State<IColorScreen> {
  late ColorBloc colorBloc;

  @override
  void initState() {
    super.initState();
    colorBloc = BlocProvider.of<ColorBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("get color list"),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<ColorBloc, ColorState>(
                builder: (context, state) {
                  if (state is ColorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ColorLoaded) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          ColorEntity entity = state.list[index];
                          return Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                entity.name,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          );
                        });
                  }
                  return Container();
                },
                listener: (context, state) {}),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  colorBloc.add(GetColors());
                },
                child: Text("Get List"))
          ],
        ),
      ),
    );
  }
}
