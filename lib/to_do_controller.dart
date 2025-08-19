import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  var tasks = <String>[].obs;
  var textController = TextEditingController();

  void addTask() {
    if (textController.text.trim().isNotEmpty) {
      tasks.add(textController.text.trim());
      textController.clear();
    }
  }
}
