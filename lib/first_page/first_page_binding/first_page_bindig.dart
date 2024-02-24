import 'package:get/get.dart';
import 'package:to_do_list/first_page/first_page_controller/first_page_controller.dart';

class FirstPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FirstPageController());
  }

}