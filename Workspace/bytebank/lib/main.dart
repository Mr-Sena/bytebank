import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Transferências'),), //Barra do app - Extende uma faixa horizontal na parte superior, Com o nome 'Transferências'
        floatingActionButton: FloatingActionButton( // Botão flutuante. Icone do botão definida no Child, pela Icon (que recebe o icone definitivamente)
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
      ),
    ));
