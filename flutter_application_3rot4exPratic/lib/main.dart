import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Inicial")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MensagemLifecycleScreen(),
              ),
            );
          },
          child: const Text("Abrir tela"),
        ),
      ),
    );
  }
}

class MensagemLifecycleScreen extends StatefulWidget {
  const MensagemLifecycleScreen({super.key});

  @override
  State<MensagemLifecycleScreen> createState() =>
      _MensagemLifecycleScreenState();
}

class _MensagemLifecycleScreenState extends State<MensagemLifecycleScreen> {
  bool mensagemVisivel = true;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Tela iniciada");
  }

  @override
  void dispose() {
    print("Tela finalizada");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Tela reconstruída");

    return Scaffold(
      appBar: AppBar(title: const Text("Mensagem Lifecycle")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Digite sua mensagem",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {}); // atualiza a tela enquanto digita
              },
            ),

            const SizedBox(height: 20),

            if (mensagemVisivel)
              Text(
                controller.text.isEmpty
                    ? "Digite algo acima..."
                    : controller.text,
                style: const TextStyle(fontSize: 20),
              ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  mensagemVisivel = !mensagemVisivel;
                });
              },
              child: Text(
                mensagemVisivel ? "Esconder mensagem" : "Mostrar mensagem",
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Fechar tela"),
            ),
          ],
        ),
      ),
    );
  }
}
