import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_list/Screens/widgets/Bottomsheet.dart';
import 'package:student_list/applications/core/constants.dart';
import 'package:student_list/database/student_list_model.dart';
import 'package:student_list/logics/cubit/cubit/counter_cubit.dart';

class AddStudentscreen extends StatelessWidget {
  AddStudentscreen({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  String name = '';
  String domain = '';
  String phone = '';
  String place = '';
  // XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Add Student'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Form(
              key: formkey,
              child: Column(children: [
                kheight10,
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    BlocBuilder<CounterCubit, CounterState>(
                      builder: (context, state) {
                        if (state.image == null) {
                          return CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(
                                'asset/images/blank-profile-picture-973460_640.png'),
                          );
                        } else {
                          return CircleAvatar(
                            radius: 70,
                             backgroundImage: FileImage(File(state.image!)),
                          );
                        }
                      },
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Name',
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
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          boxAdd(context, state.image ?? '');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(500, 50),
                        ));
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  ///Adding to box
  void boxAdd(BuildContext context, String image) {
    if (formkey.currentState!.validate()) {
      final StudentItem studentlist = StudentItem(
          name: name, domain: domain, phone: phone, place: place, image: image);
      context.read<CounterCubit>().addList(studentlist);
      Navigator.pop(context);
    }
  }
}
