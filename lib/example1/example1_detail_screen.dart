
import 'package:bloc_with_event/example1/models/user_model.dart';
import 'package:flutter/material.dart';

class Example1DetailScreen extends StatelessWidget {
  final UserModel model;
  const Example1DetailScreen({super.key ,required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CircleAvatar(
                backgroundImage: NetworkImage(model.avatar),
                radius: 60.0,
              ),

              Text("${model.firstname} ${model.lastname}"),
              Text(model.email)
            ],
          ),
        ),
      ),
    );
  }
}
