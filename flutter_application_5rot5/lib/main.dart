import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home.dart';
import 'screens/task_screen.dart';
import 'screens/pagina1.dart';
import 'screens/pagina2.dart';
import 'screens/pagina3.dart';
import 'screens/carrinho.dart';
import 'screens/formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? ultimaPagina;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarUltimaPagina();
  }

  Future<void> carregarUltimaPagina() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      ultimaPagina = prefs.getString('pagina');
      carregando = false;
    });
  }

  Widget getTelaInicial() {
    switch (ultimaPagina) {
      case 'A':
        return const PaginaA();
      case 'B':
        return const PaginaB();
      case 'C':
        return const PaginaC();
      case 'TAREFAS':
        return const TaskScreen();
      case 'FORM':
        return const FormularioScreen();
      case 'CARRINHO':
        return const CarrinhoScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: getTelaInicial(),
    );
  }
}
