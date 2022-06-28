import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_list/Screens/widgets/Bottomsheet.dart';
import 'package:student_list/database/student_list_model.dart';
import 'package:student_list/logics/cubit/cubit/counter_cubit.dart';
import '../applications/core/constants.dart';

class EditScreen extends StatelessWidget {
  final int index;
  EditScreen({Key? key, required this.index}) : super(key: key);
  final formkeyEdit = GlobalKey<FormState>();
  String name = '';
  String domain = '';
  String phone = '';
  String place = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Edit Student'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Form(
              key: formkeyEdit,
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Column(children: [
                    kheight10,
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        state.image == null
                            ? CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(File(
                                    state.studentlist[index].image.toString())),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    FileImage(File(state.image.toString())),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              showSheet(context);
                            },
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.green,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                    kheight20,
                    TextFormField(
                        initialValue: state.studentlist[index].name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          } else {
                            name = value;
                            return null;
                            //want to check this null
                          }
                        }),
                    kheight20,
                    TextFormField(
                        initialValue: state.studentlist[index].domain,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Domain',
                          prefixIcon: const Icon(Icons.domain),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          } else {
                            domain = value;
                            return null;
                          }
                        }),
                    kheight20,
                    TextFormField(
                        initialValue: state.studentlist[index].phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Mobile Number',
                          prefixIcon: const Icon(Icons.mobile_friendly),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          } else {
                            phone = value;
                            return null;
                          }
                        }),
                    kheight20,
                    TextFormField(
                        initialValue: state.studentlist[index].place,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Place',
                          prefixIcon: const Icon(Icons.place),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          } else {
                            place = value;
                            return null;
                          }
                        }),
                    kheight20,
                    ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: () async {
                          // editList(context, index);
                          if (formkeyEdit.currentState!.validate()) {
                            final StudentItem studentListNew = StudentItem(
                              name: name,
                              domain: domain,
                              phone: phone,
                              place: place,
                              image: state.image,
                              
                            );
                            context
                                .read<CounterCubit>()
                                .editImage(index, studentListNew);
                            Navigator.pop(
                              context,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(500, 50),
                        )),
                  ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void editList(BuildContext context, int index) {
  //   if (formkeyEdit.currentState!.validate()) {
  //     final StudentItem studentListNew = StudentItem(
  //       name: name,
  //       domain: domain,
  //       phone: phone,
  //       place: place,
  //     );
  //     context.read<CounterCubit>().editImage(state.studentlist[index].key, studentListNew);
  //     Navigator.pop(
  //         context, [name[index], domain[index], phone[index], place[index]]);
  //   }
  // }
}
