import 'package:bloc_with_event/example1/blocs/user_bloc.dart';
import 'package:bloc_with_event/example1/example1_detail_screen.dart';
import 'package:bloc_with_event/example1/repos/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/user_model.dart';

class Example1Screen extends StatelessWidget {
  const Example1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),

      child: BlocProvider<UserBloc>(
        create: (context) =>
            UserBloc(RepositoryProvider.of<UserRepository>(context))
              ..add(LoadUserEvent()),
        child: const IExample1Screen(),
      ),
      // child: const IExample1Screen(),
    );
  }
}

class IExample1Screen extends StatelessWidget {
  const IExample1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("the bloC app"),
      ),

      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoadedState) {
          List<UserModel> users = state.users;
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Example1DetailScreen(model: users[index])));
                  },
                  child: Card(
                    color: Colors.blue,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10.0),
                    child: ListTile(
                      title: Text(
                        users[index].firstname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        users[index].lastname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(users[index].avatar),
                      ),
                    ),
                  ),
                );
              });
        } else if (state is UserErrorState) {
          return const Center(
            child: Text("Error occurred"),
          );
        }

        return const SizedBox.shrink();
      }),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            BlocProvider.of<UserBloc>(context).add(LoadUserEvent());
          }),
      // ),
    );
  }
}
