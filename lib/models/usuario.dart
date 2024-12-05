class Usuario {
  final String nome;
  final String sobrenome;
  final String dataNasc;
  final String email;
  final String senha;
  final String cpf;
  final String? cref;

  Usuario({
    required this.nome,
    required this.sobrenome,
    required this.dataNasc,
    required this.email,
    required this.senha,
    required this.cpf,
    this.cref
  });
}