import 'package:cotacao/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:scoped_model/scoped_model.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final _formkey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  final _nameControler = TextEditingController();
  final _idControler = TextEditingController();
  final _freteKgControler = TextEditingController();
  final _freteNfControler = TextEditingController();
  final _redespachoControler = TextEditingController();
  final _ajusteControler = TextEditingController();
  final _frete_minControler = TextEditingController();
  final _obsControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text("Cadastro cidade"),
          centerTitle: true,
        ),
        body: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  controller: _idControler,
                  decoration: InputDecoration(hintText: "Código"),
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if (text.trim().isEmpty) {
                      return "Código vazio";
                    } else {
                      int id = int.parse(text ?? 0);
                      if (id < 10000 && id > 99999) return "Código inválido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nameControler,
                  decoration: InputDecoration(hintText: "Nome"),
                  keyboardType: TextInputType.text,
                  validator: (text) {
                    if (text.trim().isEmpty || text.length < 6)
                      return "Nome inválido";
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _freteKgControler,
                  decoration: InputDecoration(hintText: "R\$ Frete por kg"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (text) {
                    if (text.trim().isEmpty) {
                      return "R\$ Frete por kg vazio";
                    } else {
                      if (double.parse(text) < 0) return "R\$ Frete por kg";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _freteNfControler,
                  decoration: InputDecoration(hintText: "% do valor NFe"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (text) {
                    if (text.trim().isEmpty) {
                      return "% do valor NFe vazio";
                    } else {
                      if (double.parse(text) < 0) return "% do valor NFe";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _redespachoControler,
                  decoration: InputDecoration(hintText: "R\$ Redespacho "),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (text) {
                    if (text.trim().isEmpty) {
                      return "R\$ Redespacho vazio";
                    } else {
                      if (double.parse(text) < 0) return "R\$ Redespacho";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _frete_minControler,
                  decoration: InputDecoration(hintText: "R\$ Frete minimo"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (text) {
                    if (text.trim().isEmpty) {
                      return "R\$ Frete minimo vazio";
                    } else {
                      if (double.parse(text) < 0) return "R\$ Frete minimo";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _obsControler,
                  decoration: InputDecoration(hintText: "Observações"),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        City(
                          name: _nameControler.text.toUpperCase(),
                          freteKg: double.parse(_freteKgControler.text),
                          freteNf: double.parse(_freteNfControler.text),
                          redespacho: double.parse(_redespachoControler.text),
                          freteMin: double.parse(_frete_minControler.text),
                          id: int.parse(_idControler.text),
                        ).setFirebase();
                      }
                    },
                    child: Text(
                      "Gravar cidade",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).textTheme.body1.color),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            )));
  }

  void _onSucess() {
    _scaffold.currentState.showSnackBar(SnackBar(
      content: Text(
        "Usuário criado com sucesso",
        style: TextStyle(color: Theme.of(context).textTheme.body1.color),
      ),
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffold.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(
        "Falha ao criar usuário",
        style: TextStyle(color: Theme.of(context).textTheme.body1.color),
      ),
      duration: Duration(seconds: 2),
    ));
  }
}
