import 'package:flutter/material.dart';
import './welcome.dart';
import './dataInput.dart';
import './registration.dart';
import './datadisplay.dart';
import 'api/firestore.dart';
import 'model/savedDara.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final partnerId = '1'; // fix id
  SavedData fbData;
  String showedColor = "red";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    fbData = await readData(partnerId);
    print(fbData.message);
    setState(() {
      showedColor = fbData.color;
    });
    print(showedColor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: getColor(showedColor),
        accentColor: Colors.green,
      ),
      initialRoute: Welcome.id,
      //initialRoute: Registration.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        DataDisplay.id: (context) => DataDisplay(),
        DataInput.id: (context) => DataInput(),
        Registration.id: (context) => Registration(),
      },
    );
  }

  Color getColor(String str) {
    switch (str) {
      case 'red':
        {
          return Colors.red;
        }
        break;

      case 'green':
        {
          return Colors.green;
        }
        break;

      case "blue":
        {
          return Colors.blue;
        }
        break;

      default:
        {
          return Colors.white;
        }
        break;
    }
  }
}
