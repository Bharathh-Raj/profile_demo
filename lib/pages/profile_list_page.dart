import 'package:flutter/material.dart';

class ProfileListPage extends StatefulWidget {
  @override
  _ProfileListPageState createState() => _ProfileListPageState();
}

class _ProfileListPageState extends State<ProfileListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
        itemBuilder: (BuildContext context,int index) {
          return GestureDetector(
            child: Card(
              margin:const EdgeInsets.all(2),
              child: ListTile(
                title: Text('Title ' + index.toString()),
                subtitle: Text('Subtitile ' + index.toString()),
                leading: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, '/desc');
                    print('icon');
                  },
                ),
                trailing: CircleAvatar(
                  radius: 10,
                  child: Text(index.toString()),
                  backgroundColor: Colors.lightGreenAccent,
                ),
              ),
            ),
            //TODO Navigate to Profile description page
            onTap: () {
              print('gesture');
            },
          );
        },
        itemCount: 20,
      )),
    );
  }
}
