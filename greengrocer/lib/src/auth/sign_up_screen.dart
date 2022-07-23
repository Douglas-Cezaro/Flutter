import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(
        children: [
          //Titulo
          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Cadastro",
                style: TextStyle(color: Colors.white, fontSize: 35.0),
              ),
            ),
          ),
          // Formulario
          Expanded(
            flex: 2,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
