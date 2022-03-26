void main2() {
  print("Inicio");
  reqUsuario().then((usuario) {
    print("Encontrou!!! $usuario");
    autenticar(usuario).then((autenticacao) {
      print(autenticacao);
    }).catchError((e) {
      print(e);
    });
  });
}

void main() {
  print("Inicio");
  auxiliar();
  print("Fim");
}

void auxiliar() async {
  String usuario = await reqUsuario();
  bool sucesso = await autenticar(usuario);
  print(sucesso);
}

Future<String> reqUsuario() async {
  await Future.delayed(Duration(seconds: 2));
  print("Encontrou usuário Douglas Cezaro");
  return 'Douglas Cezaro';
}

Future<bool> autenticar(String usuario) async {
  await Future.delayed(Duration(seconds: 2));
  if (usuario == 'Douglas Cezaro') return true;
  throw UsuarioInvalido();
}

class UsuarioInvalido implements Exception {}
