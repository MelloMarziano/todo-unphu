import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var data = [];
  var txtInputController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    getAllData();
  }

  getAllData() async {
    print(box.hasData('todo'));
    data = await box.read('todo');
    update();
  }

  insertData(_data) async {
    data.add(_data);
    await box.write('todo', data);
    Get.snackbar(
      'Hola ',
      'Tarea creada',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    txtInputController.clear();
    getAllData();
  }

  updateItem(index, _data) async {
    data[index] = {'taskTile': _data['taskTile'], 'isDone': _data['isDone']};
    await box.write('todo', data);
    Get.snackbar(
      'Hola ',
      'Tarea actualizada',
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
    getAllData();
  }

  deleteItem(index) async {
    data.removeAt(index);
    await box.write('todo', data);
    getAllData();
  }
}
