import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController controller = TextEditingController();
  final List<String> tarefas = [];

  void addTask() {
    if (controller.text.isEmpty) return;
    setState(() {
      tarefas.add(controller.text);
      controller.clear();
    });
  }

  void removeTask(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Tarefas")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller)),
                IconButton(onPressed: addTask, icon: const Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  tarefa: tarefas[index],
                  onRemove: () => removeTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
