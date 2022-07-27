import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

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
        children: const [
          // Email
          CustomTextField(icon: Icons.email, label: 'E-mail'),
          // Nome
          CustomTextField(icon: Icons.person, label: 'Nome'),
          // Celular
          CustomTextField(icon: Icons.phone, label: 'Celular'),
          // CPF
          CustomTextField(icon: Icons.file_copy, label: 'CPF', isSecret: true),
          // Botão de alterar senha
        ],
      ),
    );
  }
}
