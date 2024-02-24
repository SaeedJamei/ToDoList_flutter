import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/toDo.dart';
import 'MyApp.dart';

RxList<ToDo> toDoList = <ToDo>[].obs;

void main() {
  runApp(const MyApp());
}


