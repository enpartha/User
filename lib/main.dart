// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:intl/date_symbol_data_file.dart';
//import 'package:intl/date_symbol_data_http_request.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Object? valueChoose;
  String _selectdate = "Use the Icon to choose the date";
  List listItem = ['Nurse', 'Nursing Incharge', 'Supervisor'];
  Color _iconColor = Colors.blue;
  DateTime _date = DateTime.now();
  TextEditingController _textEditingController = TextEditingController();

  void dateshower() {
    _openDatePicker(context);
    _textEditingController.text = DateFormat('yyyy/MM/dd').format(_date);
    setState(() {});
  }

  Future<Null> _openDatePicker(BuildContext context) async {
    final DateTime? d = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2050));
    if (d != null) {
      setState(() {
        _selectdate = new DateFormat.yMd("en_US").format(d).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // SizedBox(height: 10),
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
              ListTile(
                leading: Container(
                  height: double.infinity,
                  child: Icon(
                    Icons.account_circle,
                    color: _iconColor,
                    size: 30,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                  initialValue: 'User Name',
                ),
                // trailing: Icon(Icons.edit),
              ),

              ListTile(
                leading: Container(
                  height: double.infinity,
                  child: Icon(
                    Icons.local_hospital,
                    color: _iconColor,
                    size: 30,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Hospital Name",
                  ),
                ),
                // trailing: Icon(Icons.edit),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              ListTile(
                leading: Container(
                  height: double.infinity,
                  child: Icon(
                    Icons.supervisor_account,
                    color: _iconColor,
                    size: 40,
                  ),
                ),
                title: DropdownButton(
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  // icon: Icon(Icons.arrow_drop_down),
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
              ListTile(
                leading: Container(
                  height: double.infinity,
                  child: Icon(
                    Icons.work,
                    color: _iconColor,
                    size: 30,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Years Of Experience",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              // SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.verified_user,
                  color: _iconColor,
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

              SizedBox(
                height: 10,
              ),

              ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: _iconColor,
                ),
                title: Builder(builder: (context) {
                  return GestureDetector(
                    child: Builder(builder: (context) {
                      return TextFormField(
                        onTap: () => dateshower(),
                      );
                    }),
                  );
                }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
