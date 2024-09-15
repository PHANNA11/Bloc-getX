import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_state/user/controller/user_controller.dart';
import 'package:ui_state/user/screen/add_user.dart';

class ListUserScreen extends StatelessWidget {
  ListUserScreen({super.key});

  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List USER'.toUpperCase()),
      ),
      body: Obx(
        () => ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userController.lists[index].name.toString()),
                subtitle: Text(userController.lists[index].position.toString()),
                trailing:
                    Text('DOB: ${userController.lists[index].dob.toString()}'),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: userController.lists.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddEditUser());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
