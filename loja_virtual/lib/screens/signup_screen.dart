import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Criar Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: ((context, child, model) {
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
                    hintText: 'Nome Completo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty || text.trim().length <= 0) {
                      return "Este campo é obrigatório";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _nameController,
                ),
                const SizedBox(
                  height: 16.0,
                ),
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
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Endereço',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (text) {
                    if (text!.isEmpty || text.trim().length <= 0) {
                      return "Este campo é obrigatório";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _addressController,
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
                  controller: _passController,
                  onFieldSubmitted: (text) {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> userData = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "address": _addressController.text,
                      };
                      model.singUp(
                        userData: userData,
                        pass: _passController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text,
                        };
                        model.singUp(
                          userData: userData,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail,
                        );
                      }
                    },
                    child: const Text(
                      "Criar Conta",
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
        }),
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: const Text("Usuário criado com sucesso!"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState?.showSnackBar(
      const SnackBar(
        content: Text("Falha ao criar usuário"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
