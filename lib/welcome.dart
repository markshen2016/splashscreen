import 'package:flutter/material.dart';
import 'model/savedDara.dart';
import 'splash/splash_screen_1.dart';
import 'splash/splash_screen_2.dart';
import 'splash/splash_screen_3.dart';
import 'api/firestore.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeState createState() => new _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final partnerId = '1'; // fix id
  SavedData fbData;

  String showSplash = "splash1";

  @override
  void initState() {
    super.initState();
    getData();
    //
  }

  getData() async {
    fbData = await readData(partnerId);
    print(fbData.message);
    setState(() {
      showSplash = fbData.splash;
    });

    print(showSplash);
  }

  splashSelect(String sp) {
    if (sp == 'splash1') {
      return Splash1();
    } else if (sp == 'splash2') {
      return Splash2();
    } else {
      return Splash3();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: splashSelect(showSplash),
    );
  }
}
