import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:gender_selector/gender_selector.dart';
import '../widgets/gender_selector.dart';

class NewProfile extends StatefulWidget {
  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {

  final _firestore=Firestore.instance;

  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController desccontroller = TextEditingController();

  final TextEditingController numcontroller = TextEditingController();

  final TextEditingController agecontroller = TextEditingController();

  final TextEditingController gendercontroller = TextEditingController();

  final TextEditingController citycontroller = TextEditingController();

  DateTime selectedDate = DateTime.now();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _descFocus = FocusNode();
  final FocusNode _numFocus = FocusNode();
  final FocusNode _ageFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();
  final FocusNode _dobFocus = FocusNode();
  Color x=Colors.transparent;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _propicture(),
                _rowContainer('Name:', 'Enter your name', namecontroller,
                    _nameFocus, _descFocus),
                _rowContainer('Description:', 'Description here', desccontroller,
                    _descFocus, _numFocus),
                _rowContainer('Mobile Num:', 'Enter your mobile number',
                    numcontroller, _numFocus, _ageFocus, TextInputType.number),
                _rowContainer('Age:', 'Enter your age', agecontroller, _ageFocus,
                    _cityFocus, TextInputType.number),
                _rowContainer('City:', 'Enter your city', citycontroller,
                    _cityFocus, _cityFocus),
                _datepick(_dobFocus),
                _genselector(),
                _conformbutton()
              ],
            ),
          ],
        ),
        // )
      ),
    );
  }

  Widget _propicture() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: Container(
            width: MediaQuery.of(context).size.shortestSide * 0.3,
            child: Stack(children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.shortestSide * 0.15,
                child: const Text('Picture Here'),
              ),
              Container(
                height: MediaQuery.of(context).size.shortestSide * 0.3,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      child: CircleAvatar(
                        child: Icon(Icons.camera_alt),
                      ),
                      onTap: () {},
                    )),
              )
            ])),
      ),
    );
  }

  Container _rowContainer(String name, String hint, TextEditingController cont,
      FocusNode current, FocusNode next,
      [TextInputType type = TextInputType.text]) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width * (0.8 / 3),
            child: Text(name)),
        Container(
          width: MediaQuery.of(context).size.width * (1.8 / 3),
          child: TextFormField(
            controller: cont,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (String term) {
              _fieldFocusChange(context, current, next);
              if (current == next) 
                current.unfocus();
            },
            focusNode: current,
            decoration: InputDecoration(hintText: hint),
            keyboardType: type,
          ),
        )
      ],
    ));
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _datepick(FocusNode current) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * (0.8 / 3),
          child: const Text('Date of Birth:'),
        ),
        Container(
          width: MediaQuery.of(context).size.width * (1.8 / 3),
          child: TextFormField(
            keyboardType: TextInputType.datetime,
            focusNode: current,

            //*ENABLE THIS TO SHOW THE CALENDER(Step 1)

            // onTap: () {
            //   _selectDate(context);
            //   current.unfocus();
            // },
            decoration: InputDecoration(
                hintText: selectedDate.year.toString() +
                    '-' +
                    selectedDate.month.toString() +
                    '-' +
                    selectedDate.day.toString()),
          ),
        )
      ],
    ));
  }

  Widget _genselector() {
    Gender selectedGender;
    return Container(
      // color:x,
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: GenderSelector(
        onChanged: (Gender gender) async {
          setState(() {
            if (gender == Gender.FEMALE) {
              // selectedGender = "female";
              selectedGender=Gender.FEMALE;
              // x=Colors.pink;
              print('female');
            } else {
              // selectedGender = "male";
              selectedGender=Gender.MALE;
              // x=Colors.green;
              print('male');
            }
          });
        },
      ),
    );
  }

  Center _conformbutton() {
    return Center(
        child: FlatButton(
      color: Colors.blue,
      onPressed: () {
        print('Database connection successfull');
        _firestore.collection('test').add(<String,dynamic>{
          'test_field':'hello from app',
        });
      },
      child: const Text('Add Profile'),
    ));
  }

  //* ENABLE THIS TO SHOW THE CALENDER(Step 2)

  // Future<Null> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2020));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //       print(selectedDate);
  //     });
  // }

}

// class rowContainer() extends {
//     String name;
//     String hint;
//     TextEditingController cont;
//     FocusNode current;
//     FocusNode next;
//     TextInputType type=TextInputType.text;

//     rowContainer(this.name,this.hint,this.cont,this.current,this.next,[this.type])

//   }
