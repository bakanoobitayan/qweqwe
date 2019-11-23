import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class TeacherPage extends StatefulWidget{
  @override
  _TeacherPage createState()=> _TeacherPage();

}
class _TeacherPage extends State<TeacherPage> {

  String msg = '';
  TextEditingController id = new TextEditingController();
  TextEditingController u = new TextEditingController();
  TextEditingController p = new TextEditingController();
  TextEditingController level = new TextEditingController();


  Future<List> _update() async{
    final response = await http.post(
        "http://10.0.2.2/my_sql/edit.php", body: {
         "id":id.text,
        "username": u.text,
        "password": p.text,

    });
    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("TEACHER")),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),),
              Text("TEACHER ID", style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: id,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
              Text("Username", style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: u,
                decoration: InputDecoration(
                    hintText: 'Username'
                ),
              ),
              Text("Password", style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: p,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),

              RaisedButton(
                child: Text("UPDATE "),
                onPressed: () {
                  _update();
                },
              ),
              RaisedButton(
                child: Text("LOGOUT"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/MyHomePage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Admin"),),
      body: Column(
        children: <Widget>[
          Text('Hallo $username', style: TextStyle(fontSize: 20.0),),

          RaisedButton(
            child: Text("LogOUt"),
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/MyHomePage');
            },
          ),
        ],
      ),
    );
  }*/
