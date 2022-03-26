void main() {
  RepositorioPessoas repo = RepositorioPessoasRemote();

  print(repo.ler(1));
  repo.adicionar("Teste");
  repo.apagar(1);
}

abstract class RepositorioPessoas {
  String ler(int i);
  void adicionar(String nome);
  void apagar(int i);
}

class RepositorioPessoasRemote implements RepositorioPessoas {
  @override
  void adicionar(String nome) {
    // TODO: implement adicionar
  }

  @override
  void apagar(int i) {
    // TODO: implement apagar
  }

  @override
  String ler(int i) {
    return "Douglas";
  }
}

class RepositorioPessoasLocal implements RepositorioPessoas {
  @override
  void adicionar(String nome) {
    // TODO: implement adicionar
  }

  @override
  void apagar(int i) {
    // TODO: implement apagar
  }

  @override
  String ler(int i) {
    return "Cezaro";
  }
}
