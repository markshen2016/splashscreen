import 'package:flutter/material.dart';

import 'api/firestore.dart';
import 'model/savedDara.dart';
import 'welcome.dart';

class DataInput extends StatefulWidget {
  static const String id = 'input_screen';

  @override
  _DataInputState createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  final partnerId = '1'; // fix id
  SavedData fbData;

  List<String> spList = [
    "splash1",
    "splash2",
    "splash3",
  ];

  List<String> pColorList = [
    "red",
    "blue",
    "green",
  ];

  List<String> logoList = [
    "logo1",
    "logo2",
    "logo3",
  ];

  String splashDropdownValue = "splash1";
  String colorDropdownValue = "red";
  String logoDropdownValue = "logo1";
  String showMessage = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    fbData = await readData(partnerId);
    print(fbData.message);
    setState(() {
      splashDropdownValue = fbData.splash;
      colorDropdownValue = fbData.color;
      logoDropdownValue = fbData.logo;
      showMessage = fbData.message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChargeLab Demo'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 50.0,
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Text('Splash Screen Selection',
                    style: TextStyle(fontSize: 20.0)),
                DropdownButton(
                  value: splashDropdownValue,
                  onChanged: (String value) {
                    setState(() {
                      splashDropdownValue = value;
                    });
                  },
                  items: spList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text('Primary Color', style: TextStyle(fontSize: 20.0)),
                DropdownButton(
                  value: colorDropdownValue,
                  onChanged: (String value) {
                    setState(() {
                      colorDropdownValue = value;
                    });
                  },
                  items:
                      pColorList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text('Logo on Screen', style: TextStyle(fontSize: 20.0)),
                DropdownButton(
                  value: logoDropdownValue,
                  onChanged: (String value) {
                    setState(() {
                      logoDropdownValue = value;
                    });
                  },
                  items: logoList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  //keyboardType: TextInputType.text,
                  initialValue: showMessage,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    showMessage = value;
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message on screen',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: RaisedButton(
                    onPressed: () async {
                      await addData(
                        partnerId,
                        splashDropdownValue,
                        colorDropdownValue,
                        logoDropdownValue,
                        showMessage,
                      );
                      Navigator.pushNamed(context, Welcome.id);
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
