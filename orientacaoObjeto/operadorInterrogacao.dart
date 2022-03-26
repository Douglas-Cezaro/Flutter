void main() {
  Pessoa pessoa1 = Pessoa(nome: "Douglas", idade: 22);
  
  //? operador Null-Aware
  Pessoa? pessoa2;
  print(pessoa2?.nome.toUpperCase());
  print(pessoa2?.idade);
  print(pessoa2?.cidade?.toUpperCase());
  pessoa2?.comer();
}

class Pessoa {
  //Constructor
  Pessoa({required this.nome, required this.idade}) {
    print("Criando o $nome com idade $idade");
  }

  String nome;
  int idade;
  
  String? cidade;
  
  void comer(){
    print("Comendo...");
  }
}
