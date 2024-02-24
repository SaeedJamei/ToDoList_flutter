import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/first_page/first_page_controller/first_page_controller.dart';
import 'package:to_do_list/main.dart';

class FirstPage extends GetView<FirstPageController> {
  const FirstPage({super.key});

  static const String pageRote = '/';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'ToDo',
            ),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            child: Obx(() => Column(
                children: [
                  toDoList.isEmpty
                      ? const Center(child: Text('Empty'))
                      : Expanded(child: _listView()),
                ],
              )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.add,
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      );

  Widget _listView() => ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => GestureDetector(onTap:() => controller.onTap(index),child: Column(children: [const SizedBox(height: 8,),_item(index),],))
      );

  Widget _item(int index) => DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: toDoList[index].isSelected
                ? Colors.blue.shade800
                : Colors.blue.shade300),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(toDoList[index].title,style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 8,
                ),
                Text(toDoList[index].description)
              ],
            )),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                if (toDoList[index].isSelected) const Icon(Icons.check),
                IconButton(onPressed:()=> controller.onEditPressed(index), icon: const Icon(Icons.edit,color: Colors.orangeAccent,)),
                IconButton(onPressed: () => controller.onDeletePressed(index), icon: const Icon(Icons.delete,color: Colors.redAccent,))
              ],
            )
          ],
        ),
      );
}
