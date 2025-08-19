import 'package:get/get.dart';
import 'package:todolist/to_do_controller.dart';

class ToDoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ToDoController>(()=>ToDoController());
  }

}