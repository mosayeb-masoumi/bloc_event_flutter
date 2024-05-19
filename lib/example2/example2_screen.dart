

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_with_event/example2/bloc_desc/desc_bloc.dart';
import 'package:bloc_with_event/example2/bloc_title/title_bloc.dart';

// import 'bloc_title/title_bloc.dart';
// import 'bloc_desc/desc_bloc.dart';


class Example2Screen extends StatefulWidget {
  const Example2Screen({super.key});

  @override
  State<Example2Screen> createState() => _Example2ScreenState();
}

class _Example2ScreenState extends State<Example2Screen> {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<TitleBloc>(create: (context) => TitleBloc()),
        BlocProvider<DescBloc>(create: (context) => DescBloc()),

      ],
      child: const IExample2Screen(),
    );

  }
}

class IExample2Screen extends StatefulWidget {
  const IExample2Screen({super.key});

  @override
  State<IExample2Screen> createState() => _IExample2ScreenState();
}

class _IExample2ScreenState extends State<IExample2Screen> {
  @override
  Widget build(BuildContext context) {

    final titleBloc = BlocProvider.of<TitleBloc>(context);
    final descBloc = BlocProvider.of<DescBloc>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<TitleBloc, TitleState>(
              builder: (context, state) {
                if (state is TitleLoading) {
                  return const CircularProgressIndicator();
                } else if (state is TitleLoaded) {
                  return Text(state.titleResult);
                }
                return const SizedBox.shrink();
              },
              listener: (context, state) {}),
          const SizedBox(
            height: 5.0,
          ),
          ElevatedButton(
              onPressed: () {
                titleBloc.add(UpdateTitle(""));
              },
              child: const Text("Get title")),


          const SizedBox(
            height: 20.0,
          ),

          BlocConsumer<DescBloc, DescState>(
              builder: (context, state) {
                if (state is DescriptionLoading) {
                  return const CircularProgressIndicator();
                } else if (state is DescriptionLoaded) {
                  return Text(state.descResult);
                }
                return const SizedBox.shrink();
              },
              listener: (context, state) {}),

          ElevatedButton(
              onPressed: () {
                descBloc.add(UpdateDescription(""));
              },
              child: const Text("Get Description")),
        ],
      ),
    );
  }
}
