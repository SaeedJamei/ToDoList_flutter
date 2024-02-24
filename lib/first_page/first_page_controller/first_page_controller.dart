import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/second_page/second_page_view/second_page.dart';
import 'package:to_do_list/toDo.dart';

class FirstPageController extends GetxController{
  void add(){
    Get.toNamed(SecondPage.pageRote , parameters: {'index': '-1'});
  }

  void onEditPressed(int index){
    Get.toNamed(SecondPage.pageRote , parameters: {'index': index.toString()});
  }

  void onDeletePressed(int index){
    toDoList.removeAt(index);
    Get.showSnackbar(const GetSnackBar(message: 'Deleted',backgroundColor: Colors.redAccent,duration: Duration(seconds: 1),));
  }
  void onTap(int index){
    toDoList[index] = ToDo(title: toDoList[index].title, description: toDoList[index].description,isSelected: !toDoList[index].isSelected);
  }
}