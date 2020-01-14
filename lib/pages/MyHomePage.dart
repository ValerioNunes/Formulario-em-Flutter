import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:topicos1atv2/model/cardapio.dart';
import 'package:topicos1atv2/model/itemCardapio.dart';
import 'package:topicos1atv2/model/notaFiscal.dart';
import 'package:topicos1atv2/service/util.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _cpf = new MaskedTextController(mask: '000.000.000-00');
  int _radioPagamento = 0;
  List<ItemCardapio> _itens =  Cardapio.getItens();
  List<String> _itensSel = new List<String>();

  Widget MyForm(){

    void submit() {
      List<int> _itensId = this._itensSel.map((f) => int.parse(f.split('|').first)).toList();

      if(_formKey.currentState.validate()){
         _formKey.currentState.save();

         NotaFiscal notaFiscal = new NotaFiscal(_cpf.text, FormaPagamento.values[_radioPagamento]);
         _itensId.forEach((f){
           notaFiscal.addItem(Cardapio.getItemId(f));
         });

        print(notaFiscal.valorPagamento());
         Util.showInfo(context, notaFiscal.toString()  ,info: "Atenção");
      }
    }
    
    void selectPagamento(int value){
      setState(() {
        this._radioPagamento = value;
      });
    }

    return new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new Text(
                'Dado do Cliente:',
                style:  Theme.of(context).textTheme.display1,
              ),
              new TextFormField(
                  controller: _cpf,
                  keyboardType: TextInputType.number, // Use email input type for emails.
                  decoration: new InputDecoration(
                      hintText: '000.000.000-00',
                      labelText: 'CPF'
                  ),
                  validator:(String value){
                    if(!CPFValidator.isValid(value)){
                          return 'Esse CPF é Inválido';
                    }
                    return null;
                  }
              ),
              new Text(
                'Cardápio:',
                style:  Theme.of(context).textTheme.display1,
              ),
              new CheckboxGroup(
                labels: _itens.map((f) => f.id.toString() + " | "+ f.nome+" -> Preço: R\$ "+f.preco.toString()).toList(),
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> checked) => _itensSel = checked,

              ),
              new Text(
                'Forma de Pagamento:',
                style:  Theme.of(context).textTheme.display1,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioPagamento,
                    onChanged: selectPagamento,
                  ),
                  new Text(
                    'Débito',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  new Radio(
                    value: 1,
                    groupValue: _radioPagamento,
                    onChanged: selectPagamento,
                  ),
                  new Text(
                    'Crédito',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  new Radio(
                    value: 2,
                    groupValue: _radioPagamento,
                    onChanged: selectPagamento,
                  ),
                  new Text(
                    'À vista',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ]
              ),
              new Container(
                child: new RaisedButton(
                  child: new Text(
                    'Comprar',
                    style: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: submit,
                  color: Colors.green,
                ),
                margin: new EdgeInsets.only(
                    top: 20.0
                ),
              )
            ],
          ),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:  MyForm(),
      ),
    );
  }
}
