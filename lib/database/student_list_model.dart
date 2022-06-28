import 'package:hive/hive.dart';
part 'student_list_model.g.dart';
@HiveType(typeId: 0)
class StudentItem extends HiveObject {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? domain;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final String? place;

  StudentItem({
    this.image,
    this.name,
    this.domain,
    this.phone,
    this.place,
  });
}
