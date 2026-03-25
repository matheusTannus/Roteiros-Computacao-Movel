import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'product_screen.dart';
import 'list_screen.dart';
import 'task_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void go(context, screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercícios Flutter")),
      body: Center(
        // 🔥 centraliza tudo
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 🔥 não ocupa a tela toda
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => go(context, const ProfileScreen()),
                  child: const Text("Exercício 1 a 3 - Perfil"),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => go(context, const ProductScreen()),
                  child: const Text("Exercício 4 - Produtos"),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => go(context, const ListScreen()),
                  child: const Text("Exercício 5 a 8 - Lista"),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => go(context, const TaskListScreen()),
                  child: const Text("Exercício 9 - Tarefas"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
