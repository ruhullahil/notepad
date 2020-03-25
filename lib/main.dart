import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fab_circular_menu/fab_circular_menu.dart';
//import 'test/fab_menu.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'test/todo_add.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => Homepage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => Todo(),

    },
  ));
}

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('My App');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: _appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: _searchIcon,
              onPressed: () {
                setState(() {
                  if (this._searchIcon.icon == Icons.search) {
                    this._searchIcon = new Icon(Icons.close);
                    this._appBarTitle = new TextField(
                      //controller: _filter,
                      decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search),
                          hintText: 'Search...'),
                    );
                  } else {
                    this._searchIcon = new Icon(Icons.search);
                    this._appBarTitle = new Text('My App');
                    // filteredNames = names;
                    // _filter.clear();
                  }
                });
              },
            ),
            IconButton(
              icon: new Icon(Icons.more_vert),
              onPressed: () {

              },
            ),
          ],
        ),
        floatingActionButton: SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
         // visible: _dialVisible,
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.assignment),
                backgroundColor: Colors.red,
                label: 'Todo',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {
                 Navigator.pushNamed(context,'/second');
                }
            ),
            SpeedDialChild(
              child: Icon(Icons.note_add),
              backgroundColor: Colors.blue,
              label: 'Text',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('SECOND CHILD'),
            ),

          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
