import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String tarefa;
  final VoidCallback onRemove;

  const TaskTile({super.key, required this.tarefa, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tarefa),
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: onRemove),
    );
  }
}
