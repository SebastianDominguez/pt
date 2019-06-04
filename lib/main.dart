import 'package:flutter/material.dart';
import 'package:pt/widgets/local_notification_widget.dart';
import 'package:pt/Constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue, accentColor: Colors.blueAccent),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  void positivo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cigarrillos()),
    );
  }

  void negativo() {
    print("Usuario no fumo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: FlutterLogo(),
          title: Text('Vicios'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),


        body: Container(
            color: Colors.white,
            child: Column(children: [
              Column(children: [
                Image.asset('assets/cigarette.png'),
                Text(
                  '¿Ha consumido tabaco en las últimas 24 horas?',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 2.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  new IconButton(
                    color: Colors.green,
                    icon: new Icon(Icons.check),
                    splashColor: Colors.white12,
                    highlightColor: Colors.white,
                    alignment: Alignment.centerLeft,
                    tooltip:
                    'Si presiona este boton se registrará que usted SI consumió tabaco\n                                                  el día de hoy',
                    onPressed: positivo,
                    iconSize: 130,
                  ),
                  Text(
                    'Si',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
                Column(children: [
                  new IconButton(
                    icon: new Icon(Icons.close),
                    color: Colors.red,
                    splashColor: Colors.white12,
                    tooltip:
                    'Si presiona este boton se registrará que usted NO consumió tabaco\n                                                  el día de hoy',
                    highlightColor: Colors.white,
                    onPressed: negativo,
                    alignment: Alignment.centerRight,
                    iconSize: 130,
                  ),
                  Text(
                    'No',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
              ]),
            ])));
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondRoute()),
      );
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notificaciones"),
      ),
      body: Center(
        child: LocalNotificationWidget(
        ),
      ),
    );
  }
}

class Cigarrillos extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SiFumo();
  }
}

class SiFumo extends State<Cigarrillos> {
  var _cantidades = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '>10'];
  var _currentItemSelected = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cigarros"),
        ),
        body: Container(
            child: Column(children: [
              Column(children: [
                Text(
                  'Indique a continuación el número de cigarros que consumió:',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                DropdownButton<String>(
                  iconSize: 30,
                  items: _cantidades.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem,textScaleFactor: 1.1),
                    );
                  }).toList(),

                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._currentItemSelected = newValueSelected;
                    });
                  },

                  value: _currentItemSelected,

                ),
              ])
            ]))

    );}
}