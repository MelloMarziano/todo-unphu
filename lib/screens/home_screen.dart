import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_unphu/controllers/home_controller.dart';
import 'package:todo_unphu/widgets/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        drawer: Container(
          height: double.infinity,
          width: 200,
          color: Colors.red,
        ),
        appBar: AppBar(
          title: const Text(
            'All Task',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          //backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Creacion de tareas"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Titulo de la tarea'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _.txtInputController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _.insertData({
                          'taskTile': _.txtInputController.text,
                          "isDone": false
                        });
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 40),
                      ),
                      child: Text('Guardar'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          // color: Colors.grey,
          child: ListView.builder(
            itemCount: _.data.length,
            itemBuilder: ((context, index) {
              return TaskWidget(
                  title: _.data[index]['taskTile'],
                  isDone: _.data[index]['isDone'],
                  index: index);
            }),
          ),
        ),
      ),
    );
  }
}
