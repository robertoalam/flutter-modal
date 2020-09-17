import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modal/models/user.dart';

class Listagem extends StatefulWidget {
  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
    List _colegas = [
        new UserModel(id:3 , nome: "Douglas",idade :"40" ),
        new UserModel(id:4 , nome: "Michel",idade :"45" ),
        new UserModel(id:5 , nome: "Cristiano",idade :"48" ),
        new UserModel(id:6 , nome: "Diogo",idade :"38" ),
        new UserModel(id:8 , nome: "Jorge",idade :"34" ),
        new UserModel(id:9 , nome: "Guilherme",idade :"24" ),
    ];
    List<DropdownMenuItem<String>> _dropDownMenuItems;
    String _colegaSelecionado;

  List<UserModel> _colegasLista = List<UserModel>();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();

  @override
  void initState() {
      _dropDownMenuItems = getDropDownMenuItems();
      _colegaSelecionado = _dropDownMenuItems[0].value;

    _getUsuarios();
    // TODO: implement initState
    super.initState();
  }
    List<DropdownMenuItem<String>> getDropDownMenuItems() {
        List<DropdownMenuItem<String>> items = new List();
        for (UserModel colega in _colegas) {
            items.add(
                new DropdownMenuItem(
                    value: colega.id.toString(),
                    child: new Text(colega.nome)
                )
            );
        }
        return items;
    }
    void changedDropDownItem(String selecionado) {
        setState(() {
            _nomeController.text = selecionado;
            _colegaSelecionado = selecionado;
        });
    }
  _getUsuarios() {
    UserModel user = new UserModel();
    user.id = 1;
    user.nome = "beto";
    user.idade = "38";
    _colegasLista.add(user);
    user = new UserModel();
    user.id = 2 ;
    user.nome = "tonia";
    user.idade = "35";
    _colegasLista.add(user);
    setState(() {
      _colegasLista;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
//              _createDialog(context);
              _createModal(context);
          }),
      appBar: AppBar(
        title: Text("Lista de Pessoas"),
      ),
      body: _colegasLista.length <= 0
          ? Center(
              child: Text("Add form [+]"),
            )
          : ListView.builder(
              itemCount: _colegasLista.length,
              itemBuilder: (BuildContext context, int index) {
                return _card_colegasLista(context, index);
              },
            ),
    );
  }

  _createModal(BuildContext context){
      return showDialog(
          context: context,
          builder: (context) {
              return  Scaffold(
                  backgroundColor: Colors.black12,
                  body: Center(
                      child: Container(
                        width: 250,
                        height: 300 ,
                        decoration: BoxDecoration(
                          color: Colors.white,
                      ),
                        child: Column(
                          children: <Widget>[
                              Row(
                                  children: <Widget>[
                                      Icon(Icons.people),
                                      new Flexible(
                                          child: new DropdownButton(
                                              value: _colegaSelecionado,
                                              items: _dropDownMenuItems,
                                              onChanged: changedDropDownItem,
                                          )
                                      ),
                                  ],
                              ),
                              Row(
                                  children: <Widget>[
                                      Icon(Icons.filter_9_plus),
                                      new Flexible(
                                          child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: TextField(
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                      hintText: "Idade",
                                                      border: new OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(25),
                                                      ),
                                                  ),
                                                  controller: _idadeController,
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
                                              _addUsuario();
                                              Navigator.of(context).pop();
                                          },
                                      ),
                                  ],
                              )

                          ],
                      ),
                    ),
                  ),
              );
          }
      );
  }

  _card_colegasLista(context, index) {
    return
        new InkWell(
          onTap: (){
              _delete(index);
          },
          child: Card(
              child: ListTile(
                  leading: Icon(Icons.people),
                  title: Text(_colegasLista[index].nome),
                  subtitle: Text(_colegasLista[index].idade),
              ),
          ),
        );
  }
    _delete(index){
      _colegasLista.removeAt(index);
      setState(() {
        _colegasLista;
      });
    }

    _addUsuario(){
        UserModel user = new UserModel();
        user.nome = _nomeController.text.toString();
        user.idade = _idadeController.text.toString();
        _colegasLista.insert(0, user);
        setState(() {
            _colegasLista;
            _nomeController.text = "";
            _idadeController.text = "";
        });
    }
}
