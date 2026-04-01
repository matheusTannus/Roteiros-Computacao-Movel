import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class PaginaB extends StatelessWidget {
  const PaginaB({super.key});

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
      appBar: AppBar(title: const Text('Página B')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você está na Tela B'),
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
