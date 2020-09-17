import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modal/models/pessoa.dart';
import 'package:flutter_modal/models/profissao.dart';
import 'package:flutter_modal/telas/lista_profissionais_modal.dart';


class ListaProfissionais extends StatefulWidget {
  @override
  _ListaProfissionaisState createState() => _ListaProfissionaisState();
}

class _ListaProfissionaisState extends State<ListaProfissionais> {

    List<PessoaModel> _pessoasLista = [];
    List<ProfissaoModel> _profissoesLista = ProfissaoModel.getProfissoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: (){
                _abrirModal();
            },
            child: Icon(Icons.add),
        ),
      appBar: AppBar(
          title: Text("Lista de Profissionais"),
      ),
      body: _pessoasLista.length <= 0 ?
      Center(
          child: Text("Clice no Adicionar [+]"),
      ) :
      ListView.builder(
          itemCount: _pessoasLista.length,
          itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                          children: <Widget>[
                              Row(
                                  children: <Widget>[
                                      Icon(Icons.delete , color: Colors.red,),
                                      Text( _pessoasLista[index].nome+" "+_pessoasLista[index].sobrenome , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),

                                  ],
                              ),
                              Row(
                                  children: <Widget>[
                                      Text( _profissoesLista[ _pessoasLista[index].profissao - 1 ].nome.toString() ),
                                  ],
                              ),
                          ],
                      )

                  ),
              );
          },
      ),
    );
  }

  _abrirModal() async {
      var retornoLista = await showDialog(
          context: context,
          builder: (context) {
              return ListaProfissionaisModal();
          }
      );
      //SE A LISTA VIER PREENCHIDA
      if(retornoLista != null) {
          _adicionarProfissional( retornoLista[0] , retornoLista[1].toString() , retornoLista[2].toString() );
      }
  }
    _adicionarProfissional(int profissaoId , String nome , String sobrenome){
      PessoaModel pessoa = new PessoaModel();
      pessoa.profissao = profissaoId;
      pessoa.nome = nome;
      pessoa.sobrenome = sobrenome;
      _pessoasLista.add(pessoa);
      setState(() {
        _pessoasLista;
      });
    }

}
