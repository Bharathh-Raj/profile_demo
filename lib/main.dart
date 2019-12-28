import 'package:flutter/material.dart';

import 'pages/new_profile_page.dart';
import 'pages/profile_list_page.dart';
import './pages/profile_description_page.dart';
import './pages/home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Profile Demo',
      
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/':(context)=> HomePage(),
        // '/':(context)=>ProfileListPage(),
        '/desc':(context)=>Profile_description(),
      },

      // home:DefaultTabController(
      //   length:2,
      //   child:Scaffold(
      //     appBar:AppBar(
      //       leading: IconButton(
      //         icon: Icon(Icons.menu),
      //         //TODO Add icon functionality
      //         onPressed: (){},
      //         ),
      //       actions: <Widget>[
      //         IconButton(
      //           icon: Icon(Icons.more_vert),
      //           //TODO Add icon functionality
      //           onPressed: (){},
      //           ),
                
      //       ],
      //       title:Text('Profile Demo'),
      //       bottom:TabBar(
      //         tabs: <Widget>[
      //           Icon(Icons.people),
      //           Icon(Icons.add)
      //         ],
      //       )
      //     ),
      //     body:TabBarView(
      //       children: <Widget>[
      //         ProfileListPage(),
      //         NewProfile(),
      //       ],
      //     )
      //   )
      // )
    );
  }

//   class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title:'Profile Demo',
//       home:NewProfile(),
//     );
//   }
// }

}