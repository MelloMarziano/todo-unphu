import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_unphu/controllers/home_controller.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final bool isDone;
  final int index;

  const TaskWidget({
    super.key,
    required this.title,
    required this.isDone,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Dismissible(
        key: Key(index.toString()),
        background: Container(
          alignment: Alignment.centerLeft,
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 64,
          ),
        ),
        direction: DismissDirection.startToEnd,
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.startToEnd) {
            _.deleteItem(index);
          }
        },
        child: GestureDetector(
          onTap: () {
            _.updateItem(index, {'taskTile': title, 'isDone': !isDone});
          },
          child: Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: isDone ? Colors.green : Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 0.5,
                        offset: const Offset(0, 1),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ],
                  ),
                  child: Visibility(
                    visible: isDone,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
