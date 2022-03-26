void main() {
  Pessoa pessoa1 = Pessoa.casada(nome: "Douglas", idade: 22);

  print(pessoa1.nome);
  print(pessoa1.aniversario());
  print(pessoa1.casado);
  pessoa1.dinheiro = 300;
  print(pessoa1.dinheiro);
  
  //FAZER VERIFICACAO DE ATRIBUTO DA CLASSE
  String? nome = pessoa1.nomeSecreto;
  if (nome != null) {
    print(nome.toUpperCase());
  }
}

class Pessoa {
  //Constructor
  Pessoa({required this.nome, required this.idade, this.casado = false}) {
    print("Criando o $nome com idade $idade");
  }

  Pessoa.casada({required this.nome, required this.idade, this.casado = true});

  Pessoa.solteira(
      {required this.nome, required this.idade, this.casado = false});

  String nome;
  int idade;
  bool casado;

  double _dinheiro = 0;

  String? _nomeSecreto = 'Flutter';

  get nomeSecreto {
    String? nome = _nomeSecreto;
    if (nome != null) {
      _nomeSecreto = null;
      return nome;
    }
    return null;
  }

  int aniversario() {
    print("Parabéns $nome");

    idade++;
    return idade;
  }

  void casar() {
    casado = true;
  }

  void trocarNome(String n) {
    nome = n;
  }

  set dinheiro(double valor) {
    if (valor >= 0 && valor < 1000000) {
      print("Modificando dinheiro do $nome");
      _dinheiro = valor;
    }
  }

  double get dinheiro {
    print("Lendo dinheiro do $nome");
    _dinheiro -= 100;
    return _dinheiro;
  }
}
