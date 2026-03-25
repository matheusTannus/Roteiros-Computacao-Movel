import 'package:flutter/material.dart';
import 'detail_screen.dart';
import '../widgets/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void go(context, screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleText(texto: "Perfil"),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => go(context, const DetailScreen()),
              child: const Text("Ir para Detalhe"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}
