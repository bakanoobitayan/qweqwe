import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AdminPage extends StatefulWidget{
  @override
  _AdminPage createState()=> _AdminPage();




}
class _AdminPage extends State<AdminPage> {

  String msg = '';
  TextEditingController u = new TextEditingController();
  TextEditingController p = new TextEditingController();
  TextEditingController level = new TextEditingController();

  Future<List> _register() async {
    final response = await http.post(
        "http://10.0.2.2/my_sql/register.php", body: {
      "username": u.text,
      "password": p.text,
      "level": level.text,

    });
    print(response.body);
    String responsestr = response.body;
    if(responsestr=='NALABAY'){
      setState(() {
        msg="SUCCESSFULLY REGISTERED!";
      });
    }
  }
  Future <List> _delete() async{
    final response = await http.post(
        "http://10.0.2.2/my_sql/delete.php", body: {
        "id":u.text,

    });
    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("ADMIN")),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),),

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
              Text("User Type", style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: level,
                decoration: InputDecoration(
                    hintText: 'user level'
                ),
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: () {
                  _register();
                },
              ),
              RaisedButton(
                child: Text("DELETE"),
                onPressed: () {
                  _delete();
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
