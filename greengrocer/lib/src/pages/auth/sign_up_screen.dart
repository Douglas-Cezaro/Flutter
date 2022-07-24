import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/auth/components/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final phoneFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  //Titulo
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 35.0),
                      ),
                    ),
                  ),
                  // Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 40.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email
                        const CustomTextField(
                          icon: Icons.email,
                          label: "Email",
                          inputType: TextInputType.emailAddress,
                        ),
                        // Senha
                        const CustomTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          isSecret: true,
                        ),
                        // Nome
                        const CustomTextField(
                          icon: Icons.person,
                          label: "Nome",
                        ),
                        // Celular
                        CustomTextField(
                          inputFormatters: [phoneFormatter],
                          icon: Icons.phone,
                          label: "Celular",
                          inputType: TextInputType.phone,
                        ),
                        // CPF
                        CustomTextField(
                          inputFormatters: [cpfFormatter],
                          icon: Icons.file_copy,
                          label: "CPF",
                          inputType: TextInputType.number,
                        ),
                        // Botão Registrar
                        SizedBox(
                          height: 50.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Registrar",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10.0,
                top: 10.0,
                child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
