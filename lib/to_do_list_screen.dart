import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist/to_do_controller.dart';

class ToDoListScreen extends StatelessWidget {
  ToDoListScreen({super.key});
  final ToDoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            children: [
              Text('To-Do List'),
              SizedBox(width: 20),
              Icon(
                Icons.check_circle,
                color: Colors.greenAccent.shade400,
                size: 32,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    controller.addTask();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListTile(
                      leading: Icon(Icons.task, color: Colors.blue),
                      title: Text(controller.tasks[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.cancel, color: Colors.red),
                        onPressed: () {
                          controller.tasks.removeAt(index);
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
