import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../database/student_list_model.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final list = Hive.box<StudentItem>('studentitems').values;
  StudentBloc()
      : super(StudentInitial(
            searchValue:
                Hive.box<StudentItem>('studentItems').values.toList())) {
    on<StudentEvent>((event, emit) {
      // TODO: implement event handler
      if (event is StudentEvent) {
        List<StudentItem> listStudents = Hive.box<StudentItem>('studentItems')
            .values
            .toList()
            .where((element) =>
                element.name!.toLowerCase().contains(event.value.toLowerCase()))
            .toList();
        emit(StudentInitial(searchValue: listStudents));
      } else if (event is EmptyEvent) {
        emit(StudentInitial(searchValue: list.toList()));
      }
    });
  }
}
