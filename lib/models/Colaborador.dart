class Colaborador {

  int id;
  String nome;
  String cpf;

  Colaborador(this.id, this.nome, this.cpf) {
    this.id = id;
    this.nome = nome;
    this.cpf = cpf;
  }

  Colaborador.fromJson(Map json)
      : id = json['id'],
        nome = json['nome'],
        cpf = json['cpf'];
}