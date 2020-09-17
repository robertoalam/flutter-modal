import 'package:flutter/material.dart';
import 'package:flutter_modal/models/profissao.dart';

class ListaProfissionaisModal extends StatefulWidget {
  @override
  _ListaProfissionaisModalState createState() => _ListaProfissionaisModalState();
}

class _ListaProfissionaisModalState extends State<ListaProfissionaisModal> {

    // DROPDOW/SELECT COMBOBOX PROFISSOES
    List<ProfissaoModel> _profissoesLista = ProfissaoModel.getProfissoes();
    List<DropdownMenuItem<ProfissaoModel>> _dropDownItensProfissoes;
    ProfissaoModel _profissaoSelecionada;

    //NOME
    final _nomeController = TextEditingController();
    bool _nomeValidateController  = false;
    final _sobrenomeController = TextEditingController();
    bool _sobrenomeValidateController  = false;


    @override
    void initState() {
        setState(() {
            _dropDownItensProfissoes = getDropDownConcentradoMenuItems(_profissoesLista);
            _profissaoSelecionada = _dropDownItensProfissoes[0].value;
        });
        super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
            child: Container(
                width: 250,
                height: 270 ,
                decoration: BoxDecoration(
                    color: Colors.white,
                ),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                            Row(
                                children: <Widget>[
                                    Icon(Icons.settings),
                                    Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: new DropdownButton(
                                            value: _profissaoSelecionada,
                                            items: _dropDownItensProfissoes,
                                            onChanged: _onChangedDropDownItemProfissao,
                                        ),
                                    ),
                                ],
                            ),
                            Row(
                                children: <Widget>[
                                    Icon(Icons.person),
                                    new Flexible(
                                        child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    hintText: "Nome",
                                                    errorText: _nomeValidateController  ? "Nome Inválido" : null,
                                                    border: new OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(15),
                                                    ),
                                                ),
                                                controller: _nomeController,
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                            Row(
                                children: <Widget>[
                                    Icon(Icons.person),
                                    new Flexible(
                                        child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    hintText: "Sobrenome",
                                                    errorText: _sobrenomeValidateController  ? "Sobrenome Inválido" : null,
                                                    border: new OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(15),
                                                    ),
                                                ),
                                                controller: _sobrenomeController,
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    RaisedButton(
                                        child: Text("CANCELAR"),
                                        onPressed: (){
                                            Navigator.of(context).pop();
                                        },
                                    ),
                                    RaisedButton(
                                        child: Text("SALVAR"),
                                        onPressed: (){
                                            if(_validarTodosCampos()){
                                                var lista = _buscarDadosModal();
                                                Navigator.pop(context, lista);
                                            }
                                        },
                                    ),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
        ),
    );
  }
    _validarTodosCampos(){
        bool flag;
        List<bool> listaFlag = [];
        // nome
        flag = _validarNome();
        listaFlag.add(flag);
        // sobrenome
        flag = _validarSobrenome();
        listaFlag.add(flag);
        for(int i = 0 ; i < listaFlag.length ; i++){ if( listaFlag[i] == false) return false; }
        return true;
    }

    _validarNome(){
        if(_nomeController.text.toString().isEmpty){
            setState(() { _nomeValidateController = true; });
            return false;
        }
        setState(() { _nomeValidateController = false; });
        return true;
    }

    _validarSobrenome(){
        if(_sobrenomeController.text.toString().isEmpty){
            setState(() { _sobrenomeValidateController = true; });
            return false;
        }
        setState(() { _sobrenomeValidateController = false; });
        return true;
    }

    void _onChangedDropDownItemProfissao(ProfissaoModel selecionado) {
        setState(() {
            _profissaoSelecionada = selecionado;
        });
    }

    List<DropdownMenuItem<ProfissaoModel>> getDropDownConcentradoMenuItems(profissoes) {
        List<DropdownMenuItem<ProfissaoModel>> items = new List();
        for (ProfissaoModel profissao in profissoes) {
            items.add(
                new DropdownMenuItem(
                    value: profissao,
                    child: new SizedBox(
                        width: 170,
                        child: new Text(profissao.nome)
                    )
                )
            );
        }
        return items;
    }

    _buscarDadosModal(){
        // RETORNAR UMA LISTA COM OS PARAMETROS
        List<dynamic> parametros = [];
        //VALOR DROPBOX
        parametros.add( _profissaoSelecionada.id );
        parametros.add( _nomeController.text );
        parametros.add( _sobrenomeController.text );
        return parametros;
    }
}
