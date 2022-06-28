import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_list/logics/cubit/cubit/counter_cubit.dart';

Future<dynamic> showSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Wrap(
      children: [
        const ListTile(
          title: Text(
            'Choose From',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.image_outlined),
          title: Text('Gallery'),
          onTap: () async {
            final ImagePicker _picker = ImagePicker();
            final XFile? photo =
                await _picker.pickImage(source: ImageSource.gallery);
            context.read<CounterCubit>().showImage(photo);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.camera_alt_outlined),
          title: Text('Camera'),
          onTap: () async {
            final ImagePicker _picker = ImagePicker();
            final XFile? photo =
                await _picker.pickImage(source: ImageSource.camera);
            context.read<CounterCubit>().showImage(photo);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
