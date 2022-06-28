import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_list/Screens/home.dart';
import 'package:student_list/logics/bloc/bloc/student_bloc.dart';
import 'package:student_list/logics/cubit/cubit/counter_cubit.dart';

import 'database/student_list_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentItemAdapter());
  await Hive.openBox<StudentItem>('studentItems');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => StudentBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
