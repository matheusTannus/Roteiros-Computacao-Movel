import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Tela1());
  }
}


// TELA 1

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  int valorAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Valor atual: $valorAtual",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tela2()),
                );

                if (resultado != null) {
                  setState(() {
                    valorAtual = resultado;
                  });
                }
              },
              child: const Text("Escolher Número"),
            ),
          ],
        ),
      ),
    );
  }
}


// TELA 2

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  final TextEditingController _controller = TextEditingController();

  void _enviarNumero() {
    final texto = _controller.text;

    if (texto.isNotEmpty) {
      final numero = int.tryParse(texto);

      if (numero != null) {
        Navigator.pop(context, numero);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Digite um número válido")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela 2")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite um número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _enviarNumero,
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
