import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_lanche/controllers/api.dart';
import 'package:projeto_lanche/models/Colaborador.dart';

class ListaColaboradores extends StatefulWidget {
  const ListaColaboradores({Key? key}) : super(key: key);

  @override
  _ListaColaboradoresState createState() => _ListaColaboradoresState();
}

class _ListaColaboradoresState extends State<ListaColaboradores> {

  var colaboradores = <Colaborador>[];

  _getColaborador()  {
    API.getColaborador().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        colaboradores = lista.map((model) => Colaborador.fromJson(model)).toList();
      });
    });
  }

  _navigateAddColaborador(BuildContext context) async {

  }

  @override
  void initState() {
    super.initState();
    this._getColaborador();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Lista de Colaboradores'),
        ),
        body: listaColaboradores(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add, size: 30,),
          backgroundColor: Colors.indigo[900],
        ),
      ),
    );
  }
  listaColaboradores() {
    return ListView.builder(
        itemCount: colaboradores.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  child: Container(
                    height: 100.3,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Nome: " + colaboradores[index].nome,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "CPF: " + colaboradores[index].cpf,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        }
    );
  }
}
