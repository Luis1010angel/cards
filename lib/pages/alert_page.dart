import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'guardar_page.dart';

class AlertPage extends StatelessWidget {
  AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertPage"),
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            ListTile(
              title: Text("Alert Dialog"),
              onTap: () {
                _alertDialog(context);
              },
            ),
            ListTile(
              title: Text("Simple Dialog"),
              onTap: () {
                _showDialog(context);
              },
            ),
            ListTile(
              title: Text("Show Modal"),
              onTap: () {
                _showModal(context);
              },
            ),
            ListTile(
              title: Text("Show Toast "),
              onTap: () {
                _showToast(context);
              },
            ),
            ListTile(
              title: Text("Dialog Personal"),
              onTap: () {
                _dialogPersonal(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialogo'),
          content: Text('Mensaje de Advertencia'),
          actions: <Widget>[
            FlatButton(
              child: Text('salir'),
              onPressed: () {
                Navigator.of(context).pop('Aceptar');
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Dialogo simple"),
            children: <Widget>[
              ListTile(
                title: Text("Eliminar"),
                leading: Icon(Icons.delete),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Editar"),
                leading: Icon(Icons.edit),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Alerta"),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Show Modal"),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Bottom"),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        });
  }

  void _showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _dialogPersonal(BuildContext context) {
    String _texto = 'Mensaje perosonalizado';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: _texto),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GuardarPage(_texto)),
                          );
                        },
                        child: Text(
                          "Escribir mensaje",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}