import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_list/Screens/editScreen.dart';
import 'package:student_list/applications/core/constants.dart';
import 'package:student_list/database/student_list_model.dart';
import 'package:student_list/logics/cubit/cubit/counter_cubit.dart';

class ReadScreen extends StatelessWidget {
  final int index;

  const ReadScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditScreen(
                        
                        index: index,
                      )));
            },
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return ListView(
            children: [
              kheight10,
              CircleAvatar(
                radius: 70,
                backgroundImage:
                    FileImage(File(state.studentlist[index].image.toString())),
              ),
              kheight30,
              ReadView(
                heading: 'Name:',
                title: state.studentlist[index].name.toString(),
              ),
              kheight20,
              ReadView(
                  heading: 'Domain:',
                  title: state.studentlist[index].domain.toString()),
              kheight20,
              ReadView(
                  heading: 'Phone:',
                  title: state.studentlist[index].phone.toString()),
              kheight20,
              ReadView(
                  heading: 'Place:',
                  title: state.studentlist[index].place.toString()),
            ],
          );
        },
      ),
    );
  }
}

class ReadView extends StatelessWidget {
  final String heading;
  final String title;
  ReadView({Key? key, required this.heading, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
