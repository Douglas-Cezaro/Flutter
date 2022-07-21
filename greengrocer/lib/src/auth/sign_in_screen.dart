import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nome do app
                const Text.rich(
                  TextSpan(
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Green",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "grocer",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ]),
                ),
                // Categorias
                SizedBox(
                  height: 30.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 25.0),
                    child: AnimatedTextKit(
                      pause: Duration.zero,
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText("Frutas"),
                        FadeAnimatedText("Verduras"),
                        FadeAnimatedText("Legumes"),
                        FadeAnimatedText("Carnes"),
                        FadeAnimatedText("Cereais"),
                        FadeAnimatedText("Laticíneos"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Formulário
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email
                const CustomTextField(
                  label: "Email",
                  icon: Icons.email,
                ),
                // Senha
                const CustomTextField(
                  label: "Senha",
                  icon: Icons.lock,
                  isSecret: true,
                ),
                // Botão de Entrar
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    onPressed: () {},
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                // Esqueceu a senha
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Esqueceu a senha?",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )),
                ),
                // Divisor
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text("Ou")),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                // Botão de novo usuário
                SizedBox(
                  height: 50.0,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.green,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
