part of 'student_bloc.dart';

@immutable
abstract class StudentBlocEvent{}

class StudentEvent extends StudentBlocEvent {
  String value;
  StudentEvent({required this.value});
}
class EmptyEvent extends StudentBlocEvent{}
