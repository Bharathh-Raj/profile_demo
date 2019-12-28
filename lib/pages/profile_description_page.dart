import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile_description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
        title: Text('Profile Description'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: CircleAvatar(
              radius: 120,
              child: null,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Rowinfo(Icon(Icons.person_outline),'Name', 'Bharath'),
              Rowinfo(Icon(Icons.edit),'desc', 'sdafsaf'),
              Rowinfo(Icon(Icons.phone),'Mobile no', '343232'),
              Rowinfo(Icon(Icons.format_list_numbered),'Age', '23'),
              Rowinfo(Icon(Icons.sentiment_satisfied),'Gender', 'male'),
              Rowinfo(Icon(Icons.location_city),'City', 'kovilpatti')
            ],
          ),
        ],
      ),
    );
  }
}

class Rowinfo extends StatelessWidget {
  String s1, s2;
  Icon s;
  Rowinfo(this.s,this.s1, this.s2);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:s ,
      title: Text(s1),
      subtitle: Text(s2),
    );
  }
}
