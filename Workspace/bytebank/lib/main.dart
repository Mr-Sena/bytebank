import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencias(),
      ),
    );
  }
}



class FormularioTransferencias extends StatelessWidget {
  const FormularioTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Efetivação de Transferência'),),
      body: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              style: TextStyle(
                fontSize: 24.00
              ),

              decoration: InputDecoration(
                labelText: 'Número da conta: ',
                hintText: '0000',
              ),

              keyboardType: TextInputType.number,

            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              style: TextStyle(
                  fontSize: 24.00
              ),

              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor: ',
                hintText: '00.00',
              ),

              keyboardType: TextInputType.number,

            ),
          ),

          ElevatedButton(
              onPressed: () {},
              child: Text('Confirmar'),
          )

        ],
      )
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências'),), //Barra do app - Extende uma faixa horizontal na parte superior, Com o nome 'Transferências'
      body: Column(
        children: <Widget>[

          ItemTransferencia(Transferencia(37.00, 5537)),
          ItemTransferencia(Transferencia(57.00, 7542)),
          ItemTransferencia(Transferencia(34.00, 7321)),



        ],
      ),

      floatingActionButton: FloatingActionButton( // Botão flutuante. Icone do botão definida no Child, pela Icon (que recebe o icone definitivamente)
        onPressed: () {  },
        child: Icon(Icons.add),
      ),

    );
  }

}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;


  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {

    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(this._transferencia.valor.toString()),
          subtitle: Text(this._transferencia.numeroConta.toString()),
        )
    );

  }

}

class Transferencia {

  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);


}
