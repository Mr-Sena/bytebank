import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('110.00'),
                subtitle: Text('1000'),
              )
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100.00'),
                subtitle: Text('1000'),
              )
            ),
          ],
        ),
        appBar: AppBar(title: Text('Transferências'),), //Barra do app - Extende uma faixa horizontal na parte superior, Com o nome 'Transferências'
        floatingActionButton: FloatingActionButton( // Botão flutuante. Icone do botão definida no Child, pela Icon (que recebe o icone definitivamente)
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
      ),
    ));
