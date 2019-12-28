import 'package:flutter/material.dart';

import 'new_profile_page.dart';
import 'profile_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: DefaultTabController(
          length:2,
          child:Scaffold(
            appBar:AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                //TODO Add icon functionality
                onPressed: (){},
                ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert),
                  //TODO Add icon functionality
                  onPressed: (){},
                  ),
                  
              ],
              title:Text('Profile Demo'),
              bottom:TabBar(
                tabs: <Widget>[
                  Icon(Icons.people),
                  Icon(Icons.add)
                ],
              )
            ),
            body:TabBarView(
              children: <Widget>[
                ProfileListPage(),
                NewProfile(),
              ],
            )
          )
        ),
    );
  }
}