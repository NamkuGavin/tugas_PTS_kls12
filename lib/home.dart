import 'dart:convert';

import 'package:api_list_tuto/detail.dart';
import 'package:api_list_tuto/login.dart';
import 'package:api_list_tuto/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SportsModel? _model;
  bool _isLoading = false;
  List<Sport> _modelSport = [];

  getListApi() async {
    setState(() {
      _isLoading = true;
    });
    final res = await http.get(
        Uri.parse("https://www.thesportsdb.com/api/v1/json/2/all_sports.php"));
    print("STATUS CODE: " + res.statusCode.toString());
    _model = SportsModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      _modelSport = _model!.sports;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Welcome to API"),
          leading: IconButton(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: Icon(Icons.logout)),
        ),
        body: Center(
          child: Container(
            child: _isLoading
                ? CircularProgressIndicator()
                : ListView.separated(
                    itemCount: _modelSport.length,
                    itemBuilder: (BuildContext context, int index) {
                      int number = index + 1;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        image: _modelSport[index].strSportThumb,
                                        desc: _modelSport[index]
                                            .strSportDescription,
                                        judul: _modelSport[index].strSport,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text(number.toString())),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Image.network(
                                            _modelSport[index].strSportThumb)),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(_modelSport[index].strSport,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                        Text(_modelSport[index].strFormat,
                                            style: TextStyle(fontSize: 11)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Image.network(
                                        _modelSport[index].strSportIconGreen,
                                        scale: 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 5)),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Would you like to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
