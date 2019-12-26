import 'package:flutter/material.dart';


import 'package:gender_selector/gender_selector.dart';

class NewProfile extends StatefulWidget {

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {

  final TextEditingController namecontroller=new TextEditingController();

  final TextEditingController desccontroller=new TextEditingController();

  final TextEditingController numcontroller=new TextEditingController();

  final TextEditingController agecontroller=new TextEditingController();

  final TextEditingController gendercontroller=new TextEditingController();

  final TextEditingController citycontroller=new TextEditingController();

  DateTime selectedDate = DateTime.now();

  String selectedGender="male";

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('New Profile'),
        leading:IconButton(
          icon:Icon(Icons.arrow_back,),
          onPressed: null
          )
      ),     
      body: Container(
        height: double.infinity,
        width:double.infinity,
        child:ListView(
          children: <Widget>[
            rowContainer('Name:', 'Enter your name', namecontroller),
            rowContainer('Description:', 'Description here', desccontroller),
            rowContainer('Mobile Num:', 'Enter your mobile number', numcontroller,TextInputType.number),
            rowContainer('Age:', 'Enter your age', agecontroller,TextInputType.number),
            datepick(),
            genselector(),
            rowContainer('City:', 'Enter your city', citycontroller),
            conformbutton()
          ],
        )
      ),
    );
  }

  Center conformbutton(){
    return Center(
      child:FlatButton(
        color: Colors.blue,
        onPressed: (){},
        child: Text('Add Profile'),
      )
    );
  }

  GenderSelector genselector(){
    String selectedGender="female";
    return GenderSelector(
          onChanged: (gender) async {

    setState(() {
      if(gender == Gender.FEMALE) {
        selectedGender = "female";
        print('female');
      } else {
        selectedGender = "male";
        print('male');
      }
    });

  },
        );
  }

  Widget datepick(){
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width:100.0,
            child:Text(
              'Date of Birth:'
            ),
          ),
          Container(
            width:250,
            child: TextField(
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                hintText: selectedDate.year.toString()+"-"+selectedDate.month.toString()+"-"+selectedDate.day.toString()
              ),
            ),
          )
        ],
      )
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        // firstDate: DateTime(1950),
        // lastDate: DateTime(DateTime.now().year));
        firstDate: DateTime(1900),
        lastDate: DateTime(2020));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
  }

  Container rowContainer(String name,String hint,TextEditingController cont,[TextInputType type=TextInputType.text]){
    return Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    child: Text(name)
                    ),
                  Container(
                    width:250,
                    child: TextField(
                      controller: cont,
                      onSubmitted: null,
                      decoration: InputDecoration(
                        hintText: hint
                      ),
                      keyboardType: type,
                    ),
                  )
                ],
              )
            );
  }
}