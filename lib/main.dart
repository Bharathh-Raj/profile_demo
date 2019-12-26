import 'package:flutter/material.dart';

import 'pages/new_profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Profile Demo',
      home:NewProfile(),
    );
  }
}