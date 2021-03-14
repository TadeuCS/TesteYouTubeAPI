import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  const DetailPage({Key key, this.title = "DetailPage"}) : super(key: key);
  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
