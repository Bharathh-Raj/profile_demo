import 'package:flutter/material.dart';

import 'package:gender_selector/gender_selector.dart';

class NewProfile extends StatefulWidget {
  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {

  final TextEditingController namecontroller = new TextEditingController();

  final TextEditingController desccontroller = new TextEditingController();

  final TextEditingController numcontroller = new TextEditingController();

  final TextEditingController agecontroller = new TextEditingController();

  final TextEditingController gendercontroller = new TextEditingController();

  final TextEditingController citycontroller = new TextEditingController();

  DateTime selectedDate = DateTime.now();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _descFocus = FocusNode();
  final FocusNode _numFocus = FocusNode();
  final FocusNode _ageFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();
  final FocusNode _dobFocus = FocusNode();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('New Profile'),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: null)),
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
                child: Text('Picture Here'),
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
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, current, next);
              if (current == next) current.unfocus();
            },
            focusNode: current,
            decoration: InputDecoration(hintText: hint),
            keyboardType: type,
          ),
        )
      ],
    ));
  }

  _fieldFocusChange(
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
          child: Text('Date of Birth:'),
        ),
        Container(
          width: MediaQuery.of(context).size.width * (1.8 / 3),
          child: TextFormField(
            keyboardType: TextInputType.datetime,
            focusNode: current,
            //ENABLE THIS TO SHOW THE CALENDER

            // onTap: () {
            //   _selectDate(context);
            //   current.unfocus();
            // },
            decoration: InputDecoration(
                hintText: selectedDate.year.toString() +
                    "-" +
                    selectedDate.month.toString() +
                    "-" +
                    selectedDate.day.toString()),
          ),
        )
      ],
    ));
  }

  GenderSelector _genselector() {
    String selectedGender = "female";
    return GenderSelector(
      onChanged: (gender) async {
        setState(() {
          if (gender == Gender.FEMALE) {
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

  Center _conformbutton() {
    return Center(
        child: FlatButton(
      color: Colors.blue,
      onPressed: () {},
      child: Text('Add Profile'),
    ));
  }

  // ENABLE THIS TO SHOW THE CALENDER

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
