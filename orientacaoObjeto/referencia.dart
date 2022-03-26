void main() {
  Pessoa pessoa1 = Pessoa(nome: "Douglas", idade: 22);
  print(pessoa1.nome);
  print(pessoa1.idade);
  
  //Aqui ele vai estar armazenando uma referencia da pessoa1
  //então se mudar as pessoa1 vai mudar na pessoa2
  Pessoa pessoa2 = pessoa1;
  
  print(pessoa2.nome);
  pessoa1.nome = "Teste";
  print(pessoa2.nome);
  
  funcao(pessoa1);
  print(pessoa1.idade);
  
  int numero = 10;
  funcaoInt(numero);
  print(numero);
  
}

//Aqui por se tratar de uma variavel primitiva é feito a copia da variavel
void funcaoInt(int x){
  x = 20;
}

//Aqui é passado a referencia da pessoa
void funcao(Pessoa pessoa){
  pessoa.idade++;
}

class Pessoa {
  //Constructor
  Pessoa({required this.nome, required this.idade}) {
    print("Criando o $nome com idade $idade");
  }

  String nome;
  int idade;
  
}
