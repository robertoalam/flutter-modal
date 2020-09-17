import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modal/models/compania.dart';

class ListaCompany extends StatefulWidget {
  @override
  _ListaCompanyState createState() => _ListaCompanyState();
}

class _ListaCompanyState extends State<ListaCompany> {
    List<Company> _companies = Company.getCompanies();
    List<DropdownMenuItem<Company>> _dropdownMenuItems;
    Company _selectedCompany;

    @override
    void initState() {
        _dropdownMenuItems = buildDropdownMenuItems(_companies);
        _selectedCompany = _dropdownMenuItems[0].value;
        super.initState();
    }

    List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
        List<DropdownMenuItem<Company>> items = List();
        for (Company company in companies) {
            items.add(
                DropdownMenuItem(
                    value: company,
                    child: Text(company.name),
                ),
            );
        }
        return items;
    }

    onChangeDropdownItem(Company selectedCompany) {
        setState(() {
            _selectedCompany = selectedCompany;
        });
    }

    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            debugShowCheckedModeBanner: false,
            home: new Scaffold(
                appBar: new AppBar(
                    title: new Text("DropDown Button Example"),
                ),
                body: new Container(
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Text("Select a company"),
                                SizedBox(
                                    height: 20.0,
                                ),
                                DropdownButton(
                                    value: _selectedCompany,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangeDropdownItem,
                                ),
                                SizedBox(
                                    height: 20.0,
                                ),
                                Text('Selected: ${_selectedCompany.name}'),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
