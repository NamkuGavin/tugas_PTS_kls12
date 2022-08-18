import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String desc;
  final String judul;
  final String image;
  DetailPage(
      {Key? key, required this.desc, required this.judul, required this.image})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Welcome to API"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(widget.image),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Text(widget.judul,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                        Text(widget.desc),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
