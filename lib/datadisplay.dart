import 'package:flutter/material.dart';
import './dataInput.dart';
import 'api/firestore.dart';
import 'model/savedDara.dart';

class DataDisplay extends StatefulWidget {
  static const String id = 'display_screen';

  @override
  _DataDisplayState createState() => _DataDisplayState();
}

class _DataDisplayState extends State<DataDisplay> {
  final partnerId = '1'; // fix id
  SavedData fbData;
  String showedMessage = "test";
  String iconSelect = "logo1";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    fbData = await readData(partnerId);
    print(fbData.message);
    setState(() {
      showedMessage = fbData.message;
      iconSelect = fbData.logo;
    });
  }

  Icon showIcon(String selectId) {
    if (selectId == 'logo1') {
      return Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 24.0,
        semanticLabel: 'Text to announce in accessibility modes',
      );
    } else if (selectId == 'logo2') {
      return Icon(
        Icons.audiotrack,
        color: Colors.green,
        size: 30.0,
      );
    } else {
      return Icon(
        Icons.beach_access,
        color: Colors.blue,
        size: 36.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChargeLab Demo'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Test Page',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Logo test: ',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            showIcon(iconSelect),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Message Test:',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              showedMessage,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DataInput.id);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red[500],
      ),
    );
  }
}
