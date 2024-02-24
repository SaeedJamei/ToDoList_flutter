import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/toDo.dart';

class SecondPageController extends GetxController {
  SecondPageController(
    this.index,
  ) {
    if (index != -1) {
      titleEditingController.text = toDoList[index].title;
      descriptionEditingController.text = toDoList[index].description;
    }
  }

  final int index;
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController descriptionEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void onSubmitPressed() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    if (index == -1) {
      ToDo toDo = ToDo(
        title: titleEditingController.text,
        description: descriptionEditingController.text,
        isSelected: false,
      );
      toDoList.add(toDo);
      titleEditingController.clear();
      descriptionEditingController.clear();
      Get.back();
      showSnackbar('Added', Colors.green);
    } else {
      toDoList[index] = ToDo(
          title: titleEditingController.text,
          description: descriptionEditingController.text,isSelected: toDoList[index].isSelected);
      titleEditingController.clear();
      descriptionEditingController.clear();
      Get.back();
      showSnackbar('Edited', Colors.orangeAccent);
    }
  }

  void showSnackbar(String message, Color color) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    ));
  }
}
