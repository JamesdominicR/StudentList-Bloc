import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_list/logics/bloc/bloc/student_bloc.dart';
import 'package:student_list/logics/cubit/cubit/counter_cubit.dart';

class SearchBar extends StatelessWidget {
  // final void Function(String)? onTap;
  SearchBar({
    Key? key,
    // required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //context.read<CounterCubit>().studentEvent(state.);
          BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          state as StudentInitial;
          context.read<CounterCubit>().studentEvent(state.searchValue);
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 16),
              child: SafeArea(
                child: TextFormField(
                  onChanged: (value) {
                    context.read<StudentBloc>().add(StudentEvent(value: value));
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.studentlist.length,
                      itemBuilder: ((context, index) => Card(
                            child: ListTile(
                              title: Text(state.studentlist[index].name!),
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.green,
                                backgroundImage: FileImage(File(
                                    state.studentlist[index].image.toString())),
                              ),
                              onTap: () {},
                            ),
                          ))),
                );
              },
            )
          ]);
        },
      ),
    );
  }
}
