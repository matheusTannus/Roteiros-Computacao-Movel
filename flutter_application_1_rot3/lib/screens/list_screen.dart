import 'package:flutter/material.dart';
import '../widgets/product_tile.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  final List<String> produtos = const [
    "Arroz",
    "Feijão",
    "Macarrão",
    "Leite",
    "Café",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Produtos")),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ProductTile(nome: produtos[index]);
        },
      ),
    );
  }
}
