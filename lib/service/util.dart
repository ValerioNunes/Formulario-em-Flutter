import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util{

  static showInfoConfirmar(BuildContext context,String msg,{String info = "Info"}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(info,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: info.contains("Atenção")
                      ? Colors.redAccent
                      : Colors.green)),
          content: new Text(msg),
          actions: <Widget>[
            new FlatButton(
              child: new Text("SIM"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: new Text("NÃO"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            )
          ],
        );
      },
    );
  }

  static showInfoConfirmarSenha(BuildContext context,String msg,{String info = "Info"}) async {
    String senha = "";
    TextEditingController _senha= new TextEditingController();
    _senha.text = "";

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(info,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: info.contains("Atenção")
                      ? Colors.redAccent
                      : Colors.green)),
          content: TextField(
            controller: _senha,
            decoration: InputDecoration(hintText: "Digite a Senha ADM"),
            obscureText: true,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Entrar"),
              onPressed: () {
                Navigator.of(context).pop(_senha.text);
              },
            )
          ],
        );
      },
    );
  }

  static showInfo(BuildContext context,String msg,{String info = "Info"}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(info,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: info.contains("Atenção")
                      ? Colors.redAccent
                      : Colors.green)),
          content: new Text(msg),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    );
  }

  static showInfoSelectOpcao(BuildContext context,String msg,List<String> itens) async {

    Widget setupAlertDialoadContainer() {
      return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itens.length,
          itemBuilder: (BuildContext context, int index) {
            String item = itens[index];
            return ListTile(
              title: Text(item),
              onTap: () {
                Navigator.of(context).pop(item);
              },
            );
          },
        ),
      );
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(msg,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent
                      )),
          content:  setupAlertDialoadContainer(),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            )
          ],
        );
      },
    );
  }

}