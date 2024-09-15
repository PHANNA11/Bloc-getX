import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_state/user/controller/user_controller.dart';
import 'package:ui_state/user/model/user_model.dart';

class AddEditUser extends StatelessWidget {
  AddEditUser({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (contextGetx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: positionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter Position',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Date of Birth',
                    suffixIcon: GestureDetector(
                        onTap: () => _openDatePicker(context),
                        child: const Icon(Icons.date_range))),
              ),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () async {
            if (nameController.text.isNotEmpty ||
                positionController.text.isNotEmpty ||
                dobController.text.isNotEmpty) {
              await userController
                  .addUser(
                      user: UserModel(
                          id: DateTime.now().microsecondsSinceEpoch,
                          name: nameController.text,
                          position: positionController.text,
                          dob: DateFormat('dd/MMM/yyyy')
                              .parse(dobController.text)))
                  .then((value) {
                if (value) {
                  nameController.text = '';
                  positionController.text = '';
                  dobController.text = '';
                  final snackBar = SnackBar(
                    content: const Text('User was added'),
                    action: SnackBarAction(
                      label: 'Ok',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            } else {
              final snackBar = SnackBar(
                content: const Text('Field Can\'s not Empty'),
                action: SnackBarAction(
                  label: 'Ok',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.blue),
            child: const Center(
              child: Text(
                'save',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
    });
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      pickerTitle: const Text(
        'Set your Birthday',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.blue,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1996, 10, 22),
      maxDateTime: DateTime(2011),
      minDateTime: DateTime(1980),
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        final df = DateFormat('dd/MMM/yyyy');
        dobController.text = df.format(index).toString();
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
}
