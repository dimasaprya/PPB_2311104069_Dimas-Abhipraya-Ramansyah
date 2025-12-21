import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Counter')),
      body: Center(
        child: Obx(
          () => Text(
            'Counter: ${controller.count}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
