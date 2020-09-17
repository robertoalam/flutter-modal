import 'package:flutter_modal/models/profissao.dart';

class PessoaModel{
    int id;
    String nome;
    String sobrenome;
    int profissao;

    PessoaModel( {this.id ,this.nome , this.profissao} ){
        this.id= id;
        this.nome = nome;
        this.profissao = profissao;
    }
}