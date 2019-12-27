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

  final FocusNode _nameFocus = FocusNode();  
  final FocusNode _descFocus = FocusNode();  
  final FocusNode _numFocus = FocusNode();  
  final FocusNode _ageFocus = FocusNode();  
  final FocusNode _cityFocus = FocusNode();  
  final FocusNode _dobFocus = FocusNode();  
  // final FocusNode _ageFocus = FocusNode();  

  // final focus = FocusNode();

  @override
  Widget build(BuildContext context) {

    final MediaQueryData mq=MediaQuery.of(context);

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
        // child:SingleChildScrollView(
            child: ListView(

              children: <Widget>[
                Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  rowContainer('Name:', 'Enter your name', namecontroller,_nameFocus,_descFocus),
                  rowContainer('Description:', 'Description here', desccontroller,_descFocus,_numFocus),
                  rowContainer('Mobile Num:', 'Enter your mobile number', numcontroller,_numFocus,_ageFocus,TextInputType.number),
                  rowContainer('Age:', 'Enter your age', agecontroller,_ageFocus,_cityFocus,TextInputType.number),
                  rowContainer('City:', 'Enter your city', citycontroller,_cityFocus,_cityFocus),
                  datepick(_dobFocus),
                  genselector(),  
                  conformbutton()
                ],
          ),
              ],
            ),
        // )
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
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

  Widget datepick(FocusNode current){
    
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.width*(0.8/3),
            child:Text(
              'Date of Birth:'
            ),
          ),
          Container(
            width:MediaQuery.of(context).size.width*(1.8/3),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              focusNode: current,

              //ENABLE THIS TO SHOW THE CALENDER

              // onTap: () { 
              //   _selectDate(context);
              //   current.unfocus();
              // },
              decoration: InputDecoration(
                hintText: selectedDate.year.toString()+"-"+selectedDate.month.toString()+"-"+selectedDate.day.toString()
              ),
            ),
          )
        ],
      )
    );
  }

  

  Container rowContainer(String name,String hint,TextEditingController cont,FocusNode current,FocusNode next,[TextInputType type=TextInputType.text]){
    return Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*(0.8/3),
                    child: Text(name)
                    ),
                  Container(
                    width:MediaQuery.of(context).size.width*(1.8/3),
                    child: TextFormField(
                      controller: cont,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (term){
          _fieldFocusChange(context, current, next);
          if(current==next)current.unfocus();
        },
                      // onSubmitted: null,
                      focusNode: current,
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