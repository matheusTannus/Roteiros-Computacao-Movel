import 'package:flutter/material.dart';
import 'package:flutter_application_5rot5/screens/carrinho.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'task_screen.dart';
import 'pagina1.dart';
import 'pagina2.dart';
import 'pagina3.dart';
import 'formulario.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> salvarPagina(String pagina) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pagina', pagina);
  }

  void navegar(BuildContext context, Widget page, String pagina) async {
    await salvarPagina(pagina);
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  Widget botao(BuildContext context, String texto, Widget page, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => navegar(context, page, id),
        child: Text(texto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              botao(context, 'Lista de Tarefas', const TaskScreen(), 'TAREFAS'),
              botao(context, 'Página A', const PaginaA(), 'A'),
              botao(context, 'Página B', const PaginaB(), 'B'),
              botao(context, 'Página C', const PaginaC(), 'C'),
              botao(context, 'Formulário', const FormularioScreen(), 'FORM'),
              botao(context, 'Carrinho', const CarrinhoScreen(), 'CARRINHO'),
            ],
          ),
        ),
      ),
    );
  }
}
