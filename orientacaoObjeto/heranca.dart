void main() {
  Cachorro cachorro1 = Cachorro("Tadeu", 2);
  cachorro1.dormir();
  cachorro1.latir();
  cachorro1.morrer();

  print(cachorro1);

  Gato gato1 = Gato("Mimi", 2);
  gato1.dormir();
  gato1.miar();
  gato1.morrer();

  print(gato1);

  List<Animal> animais = [];

  animais.add(cachorro1);
  animais.add(gato1);

  Animal animal1 = animais.first;
  if (animal1 is Cachorro) {
    animal1.latir();
  } else if (animal1 is Gato) {
    animal1.miar();
  }

  //Cast convertendo variavel animal para Cachorro
  //Só usar se tiver certeza que a classe que ta convertendo
  Cachorro animal2 = funcao() as Cachorro;
  animal2.latir();
}

Animal funcao() {
  return Cachorro("Tadeu", 1);
}

abstract class Animal {
  Animal(this.nome, this.idade);

  String nome;
  int idade;

  void comer() {
    print("Comeu");
  }

  void dormir() {
    print("Dormiu");
  }

  //Metodo abstrado quando fica sem corpo
  //E deve ser implementado nos filhos obrigatoriamente
  void morrer();
}

class Cachorro extends Animal {
  //Com o super os valores vão ser passados para o pai
  Cachorro(String nome, int idade) : super(nome, idade) {
    print("Criando o cachorro $nome");
  }

  void latir() {
    print("Au au");
  }

  @override
  void dormir() {
    super.dormir();
    print("Roncando muito ...");
  }

  @override
  String toString() {
    return "Cachorro Nome: $nome Idade: $idade";
  }

  @override
  void morrer() {
    print("Muito triste");
  }
}

class Gato extends Animal {
  Gato(String nome, int idade) : super(nome, idade) {
    print("Criando o gato $nome");
  }
  int vidas = 7;

  void miar() {
    print("Miaaauuu");
  }

  @override
  String toString() {
    return "Gato Nome: $nome Idade: $idade";
  }

  @override
  void morrer() {
    vidas--;
    print("Sobrou $vidas vidas");
  }
}
