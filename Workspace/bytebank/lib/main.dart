import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}



class FormularioTransferencias extends StatelessWidget {
  FormularioTransferencias({Key? key}) : super(key: key);


  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Efetivação de Transferência'),),
      body: Column(
        children: <Widget>[

          Editor(
              controlador: _controladorCampoNumeroConta,
              dica: '0000',
              rotulo: 'Número da Conta: '),
          Editor(
            dica: '0.00',
            controlador: _controladorCampoValor,
            rotulo: 'Valor: ',
            icone: Icons.monetization_on,
          ),


          ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar'),
          )

        ],
      )
    );
  }

  void _criaTransferencia(BuildContext context) {
    debugPrint('Botão "confirmar" clicado. ');

    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    //Importante: Nesse caso se a tentativa de Parse (Conversão de String para o tipo númerico) falhar, o retorno será nulo
    //E, portanto, a condição a seguir se torna inteiramente efetiva na validação de sua responsabilidade.

    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      debugPrint('Criando tranferência...');
      /// Obs importante sobre o Navigator: push sobrepõe um Widget/tela sobre o outro e .pop retira esse Widget/tela e volta pra página anterior.
      /// Nesse caso, além disso, ele também devolve o atributo transferenciaCriada, fazendo o trafego de algums informações.
    }

  }

}

class Editor extends StatelessWidget {

  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;


  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(

        controller: controlador,

        style: TextStyle(
            fontSize: 24.00
        ),

        decoration: InputDecoration(
          icon: icone != null ? Icon(icone): null ,
          labelText: rotulo,
          hintText: dica,
        ),

        keyboardType: TextInputType.number,

      ),
    );
  }
}



class ListaTransferencias extends StatelessWidget {


  //TODO ver o schema dessa nova lista:
  //final List<Transferencia> _transferencia = List<Transferencia>.filled(0,new Transferencia(0, 0), growable:true);
  final List<Transferencia> _transferencias = List<Transferencia>.empty(growable:true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências'),), //Barra do app - Extende uma faixa horizontal na parte superior, Com o nome 'Transferências'
      body: ListView.builder(

        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },

      ),

      floatingActionButton: FloatingActionButton( // Botão flutuante. Icone do botão definida no Child, pela Icon (que recebe o icone definitivamente)
        onPressed: () {

          ///Função do botão: fazer a navegação entre os Widgets - as telas.
          ///Implementação: Fazer o gerenciamento dos respectivos Widgets, utilizar o recurso do Material App para fazer o direcionamento entre pags.


          final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencias();
          }
          ));


          future.then((transferenciaRecebida) => {
            debugPrint('chegou no then do future'),
            debugPrint('$transferenciaRecebida')

          });

        },
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

  @override
  String toString() {
    return 'Transferencia  {valor: $valor, numeroConta: $numeroConta}';
  }
}
