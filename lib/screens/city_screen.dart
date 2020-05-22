import 'package:estrategia/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  String _password = "";

  final _nameControler = TextEditingController();

  final _emailControler = TextEditingController();

  final _passControler = TextEditingController();

  final _phoneControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text("Criar conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            );

          return Form(
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _nameControler,
                    decoration: InputDecoration(hintText: "Nome"),
                    keyboardType: TextInputType.text,
                    validator: (text) {
                      if (text.trim().isEmpty || text.length < 6)
                        return "Nome inválido";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _emailControler,
                    decoration: InputDecoration(hintText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.trim().isEmpty || !text.contains("@"))
                        return "Email inválido";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                      controller: _phoneControler,
                      decoration: InputDecoration(hintText: "WhatsApp"),
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text.trim().isEmpty ||
                            (text.length < 8 && text.length < 9))
                          return "WhatsApp inválido";
                      }),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _passControler,
                    decoration: InputDecoration(hintText: "Senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (text) {
                      _password = text;
                      if (text.trim().isEmpty || text.length < 6)
                        return "Senha inválida";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Confirme a senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (text) {
                      if (_password != text) return "Senhas não são iguais";
                    },
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
                          Map<String, dynamic> userData = {
                            "name": _nameControler.text,
                            "email": _emailControler.text.toLowerCase(),
                            "phone": _phoneControler.text
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passControler.text,
                              onSucess: _onSucess,
                              onFail: _onFail);
                        }
                      },
                      child: Text(
                        "Criar conta",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).textTheme.body1.color),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ));
        },
      ),
    );
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
