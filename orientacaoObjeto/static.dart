void main() {
  Pessoa.alturaPadrao = 1.83;

  Pessoa pessoa1 = Pessoa(nome: "Douglas", idade: 22);

  Pessoa.atributoStatic = ', Douglas';
  print(Pessoa.metodoStatic());
  print(pessoa1.altura);
}

class Pessoa {
  //Constructor
  Pessoa({required this.nome, required this.idade}) {
    print("Criando o $nome com idade $idade");
  }

  String nome;
  int idade;
  double altura = alturaPadrao;

  //Atributo static só vai ser chamado pela classe
  static String atributoStatic = "abc";

  //Metodos static só vão ser chamados pela classe e só pode
  //atributos static já nos metodos normais os atributos static
  //podem ser utilizados
  static String metodoStatic() {
    return "Olá mundo $atributoStatic";
  }

  static double alturaPadrao = 0;
}
