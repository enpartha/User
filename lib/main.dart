import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:intl/date_symbol_data_file.dart';
//import 'package:intl/date_symbol_data_http_request.dart';
import 'package:intl/intl.dart';
import 'package:profile/device_size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String valueChoose;
  String _selectdate = "Use the button to choose the date";
  List listItem = ["Item1", "Item2", 'Item3', "Item4"];

  Future<Null> _openDatePicker(BuildContext context) async {
    final DateTime d = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime(2050));
    if (d != null) {
      setState(() {
        _selectdate = new DateFormat.yMEd("en_US").format(d).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/user2.jpg"),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.green,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.local_hospital,
                    color: Colors.green,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Hospital Name",
                    ),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    hint: Text("Role/Designation"),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.work,
                    color: Colors.green,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Years Of Experience",
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.verified_user,
                    color: Colors.green,
                  ),
                  title: Container(
                    margin: EdgeInsets.only(right: 230),
                    width: 50,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black)],
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      " UserId",
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.calendar_today,
              //       color: Colors.green,
              //     ),
              //     title: Text(_selectdate),
              //     trailing: Builder(
              //       builder: (context) {
              //         return IconButton(
              //             icon: Icon(Icons.calendar_view_day),
              //             onPressed: () {
              //               _openDatePicker(context);
              //             });
              //       },
              //     ),
              //   ),
              // )
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: Colors.green,
                ),
                title: Text(
                  "Date of Birth =>",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 50.0)),
                    Builder(builder: (context) {
                      return RaisedButton(
                          child: Text(_selectdate),
                          onPressed: () {
                            _openDatePicker(context);
                          });
                    })
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
