import 'package:flutter/material.dart';

class input_data extends StatefulWidget {
  @override
  _input_dataState createState() => _input_dataState();
}

class _input_dataState extends State<input_data> {
  @override

  TextEditingController nameInputController;
  TextEditingController eventInputController;

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String dropdownValue = 'Random event 1';
  String radioItem = '';
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter the name of the event you attended',
                labelText: 'Event name*',
              ),
                controller: nameInputController,
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },

            ),


            DropdownButtonFormField(

              value: dropdownValue,
                decoration: InputDecoration(labelText: 'Choose type of event'),
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),

                items: <String>['Hackathon', 'Codeathon', 'Random event 1', 'Random event 2']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),


                onChanged:  (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            }

            ),

            Text('Choose Venue', style: TextStyle(fontSize: 23),),

            RadioListTile(
              groupValue: radioItem,
              title: Text('MUJ'),
              value: 'MUJ',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),

            RadioListTile(
              groupValue: radioItem,
              title: Text('Outside MUJ'),
              value: 'Outside MUJ',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),

            Text('Select Date', style: TextStyle(fontSize: 23),),

            Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),


            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.perm_identity),
                hintText: 'Enter the event id',
                labelText: 'Event ID',
              ),
              controller: eventInputController,
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },

            ),


          ],
      ),

    );
  }
}


