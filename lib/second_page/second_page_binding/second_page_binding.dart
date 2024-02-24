import 'package:get/get.dart';
import 'package:to_do_list/second_page/second_page-controller/second_page_controller.dart';

class SecondPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SecondPageController(int.parse(Get.parameters['index']!)));
  }

}