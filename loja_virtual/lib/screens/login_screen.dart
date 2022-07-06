import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text!.isEmpty ||
                        text.trim().length <= 0 ||
                        !text.contains("@")) {
                      return "E-email inválido";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if (text!.isEmpty ||
                        text.trim().length <= 0 ||
                        text.trim().length < 6) {
                      return "Senha inválida";
                    }
                  },
                  onFieldSubmitted: (text) {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.right,
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      model.singIn();
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
