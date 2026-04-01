import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'home.dart';

class CarrinhoScreen extends StatefulWidget {
  const CarrinhoScreen({super.key});

  @override
  State<CarrinhoScreen> createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  final List<String> produtos = ['Produto A', 'Produto B', 'Produto C'];

  List<String> carrinho = [];

  @override
  void initState() {
    super.initState();
    carregarCarrinho();
  }

  Future<void> carregarCarrinho() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('carrinho');

    if (data != null) {
      setState(() {
        carrinho = List<String>.from(jsonDecode(data));
      });
    }
  }

  Future<void> salvarCarrinho() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('carrinho', jsonEncode(carrinho));
  }

  Future<void> salvarPaginaAtual() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pagina', 'CARRINHO');
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

  // 🔹 Adicionar item
  void adicionarItem(String produto) {
    setState(() {
      carrinho.add(produto);
    });

    salvarCarrinho();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho Simples')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Produtos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 🔹 Lista de produtos
            ...produtos.map(
              (produto) => Card(
                child: ListTile(
                  title: Text(produto),
                  trailing: ElevatedButton(
                    onPressed: () => adicionarItem(produto),
                    child: const Text('Adicionar'),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Divider(),

            const Text(
              'Carrinho',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 🔹 Lista do carrinho
            Expanded(
              child: carrinho.isEmpty
                  ? const Center(child: Text('Carrinho vazio'))
                  : ListView.builder(
                      itemCount: carrinho.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(carrinho[index]));
                      },
                    ),
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
