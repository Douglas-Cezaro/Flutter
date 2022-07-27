import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do usuário"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
        children: [
          // Email
          CustomTextField(
            icon: Icons.email,
            label: 'E-mail',
            initialValue: appData.user.email,
            readOnly: true,
          ),
          // Nome
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: appData.user.name,
            readOnly: true,
          ),
          // Celular
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
            initialValue: appData.user.phone,
            readOnly: true,
          ),
          // CPF
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            initialValue: appData.user.cpf,
            readOnly: true,
          ),
          // Botão de alterar senha
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text("Atualizar senha"),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Título
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Atualização de senha",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Senha atual
                      const CustomTextField(
                          isSecret: true,
                          icon: Icons.lock,
                          label: 'Senha atual'),
                      // Nova senha
                      const CustomTextField(
                          isSecret: true,
                          icon: Icons.lock_outline,
                          label: 'Nova senha'),
                      // Confirmação nova senha
                      const CustomTextField(
                          isSecret: true,
                          icon: Icons.lock_outline,
                          label: 'Confirmar nova senha'),
                      // Botão de confirmação
                      SizedBox(
                        height: 45.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Atualizar"),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5.0,
                  right: 5.0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                )
              ],
            ),
          );
        });
  }
}
