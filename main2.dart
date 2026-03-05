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

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

//tela 1

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

//tela 2

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 10);
              },
              child: const Text("Enviar 10"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 20);
              },
              child: const Text("Enviar 20"),
            ),
          ],
        ),
      ),
    );
  }
}
//Sem await, você não recebe o valor final, recebe apenas a promessa de que algo vai acontecer.
//Se você remover async mas mantiver o await, o código nem compila.
//Future é um tipo que representa um valor que ainda não está disponível, mas estará disponível no futuro (promessa).
//No momento em que o "Navigator.pop(context, valor);" é executado na tela 2.