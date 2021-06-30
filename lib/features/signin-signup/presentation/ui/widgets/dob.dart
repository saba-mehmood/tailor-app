import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'pallete.dart';

class DataOfBirth extends StatefulWidget {
  @override
  _DataOfBirthState createState() => _DataOfBirthState();
}

class _DataOfBirthState extends State<DataOfBirth> {
  TextEditingController dateCtl = TextEditingController();
  DateTime _dateTime;
  //var dateCtlInString;
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),

          borderRadius: BorderRadius.circular(0),
        ),
        child: Center(
          child: TextField(
            controller: dateCtl,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                    FontAwesomeIcons.calendar,
                    size: 28,
                    color: kWhite),
              ),
              hintText: 'Date of Birth',
              hintStyle: kBodyText,
            ),
           style:kBodyText,

            onTap: () {
              // Below line stops keyboard from appearing
              FocusScope.of(context).requestFocus(new FocusNode());

              //Date Picker Here
              showDatePicker(context: context,
                  initialDate:_dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(1940),
                  lastDate: DateTime(2030)).then((date) {

                setState(() {
                  _dateTime = date;
                });
                dateCtl.text = date.toString();

                //dateCtlInString = formatter.format(date);

              });
            },

          ),
        ),
      ),
    );
  }
}
