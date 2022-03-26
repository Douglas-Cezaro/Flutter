void main() {
  Pessoa pessoa1 = Pessoa(nome: "Douglas", idade: 22);
  pessoa1.cpf = "126.744.819-94";
  print(pessoa1.cpf);
  print(pessoa1.temperatura);
}

class Pessoa {
  //Constructor
  Pessoa({required this.nome, required this.idade}) {
    print("Criando o $nome com idade $idade");
  }

  String nome;
  int idade;

  //Usar quando a variavel vai ser inicializada depois
  //e tem certeza que vai ser inicializada
  late String cpf;

  //Na inicialização dos atributos não é chamado os metodos
  //Inicialização lazy
  late double temperatura = medirTemperatura();

  double medirTemperatura() {
    print("Mediu a tempuratura");
    return 37.0;
  }
}
