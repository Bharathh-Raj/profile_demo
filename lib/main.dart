import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'pages/new_profile_page.dart';

=======
import './pages/profile_description_page.dart';
>>>>>>> 62c66f4b468c1419a228c4d2c9c898f154f51f9c
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title:'Profile Demo',
      home:NewProfile(),
    );
=======
    return MaterialApp(home: Profile_description());
>>>>>>> 62c66f4b468c1419a228c4d2c9c898f154f51f9c
  }
}