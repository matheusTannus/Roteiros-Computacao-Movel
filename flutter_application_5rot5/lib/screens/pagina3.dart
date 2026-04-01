import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class PaginaC extends StatelessWidget {
  const PaginaC({super.key});

  Future<void> voltarHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('pagina');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página C')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você está na Tela C'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => voltarHome(context),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
