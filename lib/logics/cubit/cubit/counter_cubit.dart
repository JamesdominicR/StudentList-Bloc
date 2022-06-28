import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_list/database/student_list_model.dart';
part 'counter_state.dart';
class CounterCubit extends Cubit<CounterState> {
  var box = Hive.box<StudentItem>('studentItems');
  CounterCubit()
      : super(
          CounterState(
            studentlist: Hive.box<StudentItem>('studentItems').values.toList(),
          ),
        );
  void addList(StudentItem studentlist) {
    Hive.box<StudentItem>('studentitems').add(studentlist);
    emit(CounterState(studentlist: box.values.toList()));
  }

  void showImage(XFile? photo) async {
    if (photo != null) {
      emit(CounterState(studentlist: box.values.toList(), image: photo.path));
    }
  }

  void delete(int key) {
    Hive.box<StudentItem>('studentItems').delete(key);
    emit(CounterState(studentlist: box.values.toList()));
  }

  void editImage(int key, StudentItem studentList) {
    Hive.box<StudentItem>('studentItems').putAt(key, studentList);
    emit(CounterState(studentlist: box.values.toList()));
  }

  void studentEvent(List<StudentItem> value) {
    emit(CounterState(studentlist: value));
  }
}
