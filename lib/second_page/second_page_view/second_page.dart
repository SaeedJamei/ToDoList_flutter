import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/second_page/second_page-controller/second_page_controller.dart';

class SecondPage extends GetView<SecondPageController> {
  const SecondPage({super.key});

  static const String pageRote = '/secondPage';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Add/Edit'),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        controller: controller.titleEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Insert Title',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'this is required'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(maxLines: 6,
                        controller: controller.descriptionEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Insert Description',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'this is required'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    FilledButton(
                      onPressed: controller.onSubmitPressed,
                      child: const Center(
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
