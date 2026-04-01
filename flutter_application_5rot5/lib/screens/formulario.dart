import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    salvarPaginaAtual();
    carregarDados();
  }

  Future<void> carregarDados() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      nomeController.text = prefs.getString('nome') ?? '';
      emailController.text = prefs.getString('email') ?? '';
    });
  }

  Future<void> salvarNome(String valor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', valor);
  }

  Future<void> salvarEmail(String valor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', valor);
  }

  Future<void> voltarHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('pagina');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  Future<void> salvarPaginaAtual() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pagina', 'FORM');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => voltarHome(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              onChanged: salvarNome,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: salvarEmail,
            ),
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
