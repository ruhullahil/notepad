import 'package:flutter/material.dart';

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title :"Notepad",
        home: Scaffold
          (
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text("My app"),
            actions: <Widget>[
              IconButton(icon: new Icon(Icons.search),
                onPressed: (){},
              ),
              IconButton(icon: new Icon(Icons.playlist_play),
                onPressed: (){},
              ),
            ],

          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.grey,
            child: Icon(Icons.add),
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
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        )
    );
  }

}