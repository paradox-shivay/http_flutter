import 'package:flutter/material.dart';


class Information extends StatefulWidget {

  final title;
  var data;

  Information(this.title, this.data);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Container(

      ),
    );
  }
}
