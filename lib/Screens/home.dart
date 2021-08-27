import 'package:flutter/material.dart';
import 'package:survey_app/Screens/surveys.dart';
import 'package:survey_app/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Card(
                color: Colors.white,
                child: DropdownButton<String>(
                  isExpanded: false,
                  focusColor: Colors.white,
                  value: chosenValue,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      decorationStyle: TextDecorationStyle.double),
                  iconEnabledColor: Colors.black,
                  items:
                      activities.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Center(
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                  hint: Center(
                    child: Text(
                      "Please select an activity",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onChanged: (newval) {
                    setState(() {
                      chosenValue = newval!;
                    });
                  },
                ),
              ),
            ),
          ),
          // Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: SizedBox(
                width: 240,
                height: 240,
                child: ElevatedButton(
                  // icon: Icon(
                  //   Icons.play_arrow_rounded,
                  //   size: 40,
                  // ),
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SurveyPage()));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
