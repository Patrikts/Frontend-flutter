import 'package:flutter/material.dart';
import 'package:projeto_lanche/views/ListaColaboradores.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> escolha = ['Colaboradores', 'Lanches'];

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Colaboradores":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListaColaboradores()));
        break;
      case "Lanches":

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _escolhaMenuItem,
              itemBuilder: (context) {
                return escolha.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 4),
            ),
          ],
          centerTitle: true,
          title: Text('Lista de Pedidos'),
        ),
      ),
    );
  }
}
