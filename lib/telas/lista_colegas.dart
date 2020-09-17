import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modal/models/colega.dart';
import 'package:flutter_modal/models/compania.dart';

class ListaColegas extends StatefulWidget {
  @override
  _ListaColegasState createState() => _ListaColegasState();
}

class _ListaColegasState extends State<ListaColegas> {

    List<Colega> _colegas = Colega.getColegas();
    List<DropdownMenuItem<Colega>> _dropdownMenuItems;
    Colega _colegaSelecionado;

    @override
    void initState() {
        _dropdownMenuItems = buildDropdownMenuItems(_colegas);
        _colegaSelecionado = _dropdownMenuItems[0].value;
        super.initState();
    }

    List<DropdownMenuItem<Colega>> buildDropdownMenuItems(List colegas) {
        List<DropdownMenuItem<Colega>> items = List();
        for (Colega colega in colegas) {
            items.add(
                DropdownMenuItem(
                    value: colega,
                    child: Text(colega.name),
                ),
            );
        }
        return items;
    }

    onChangeDropdownItem(Colega colegaSelecionado) {
        setState(() {
            _colegaSelecionado = colegaSelecionado;
        });
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text("DropDown Exemplo"),
            ),
            body: new Container(
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text("Selecione o coleguinha"),
                            SizedBox(
                                height: 20.0,
                            ),
                            DropdownButton(
                                value: _colegaSelecionado,
                                items: _dropdownMenuItems,
                                onChanged: onChangeDropdownItem,
                            ),
                            SizedBox(
                                height: 20.0,
                            ),
                            Text('coleguinha escolhido: ${_colegaSelecionado.name}'),
                        ],
                    ),
                ),
            ),
        );
    }
}
