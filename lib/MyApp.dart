import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/first_page/first_page_binding/first_page_bindig.dart';
import 'package:to_do_list/first_page/first_page_view/first_page.dart';
import 'package:to_do_list/second_page/second_page_binding/second_page_binding.dart';
import 'package:to_do_list/second_page/second_page_view/second_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'TO Do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: FirstPage.pageRote,
        getPages: [
          GetPage(
            name: FirstPage.pageRote,
            page: () => const FirstPage(),
            binding: FirstPageBinding(),
            children: [
              GetPage(
                name: '${FirstPage.pageRote}${SecondPage.pageRote}',
                page: () => const SecondPage(),
                binding: SecondPageBinding(),
              ),
            ],
          ),
        ],
      );
}
