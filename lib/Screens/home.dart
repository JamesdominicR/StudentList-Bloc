import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_list/Screens/add_student.dart';
import 'package:student_list/Screens/read_screen.dart';
import 'package:student_list/Screens/widgets/search_bar.dart';
import 'package:student_list/logics/cubit/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: AppBar(
      //     backgroundColor: Colors.blueGrey,
      //   ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Student List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => SearchBar())));
            },
          ),
        ],
      ),

      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state.studentlist.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            return ListView.builder(
                itemCount: state.studentlist.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green,
                        backgroundImage: FileImage(
                          File(state.studentlist[index].image ?? ''),
                        ),
                      ),
                      title: Text(state.studentlist[index].name!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<CounterCubit>()
                              .delete(state.studentlist[index].key);
                        },
                        color: Colors.red,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ReadScreen(index: index)));
                      },
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStudentscreen(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
