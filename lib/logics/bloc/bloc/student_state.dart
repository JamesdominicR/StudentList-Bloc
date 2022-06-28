part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {
  List<StudentItem> searchValue;

  StudentInitial({required this.searchValue});
}



