import 'package:api_list_tuto/home.dart';
import 'package:api_list_tuto/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getString('email') == null &&
          prefs.getString('password') == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
