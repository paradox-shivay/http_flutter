import 'package:flutter/material.dart';

import 'Information.dart';
import 'RestApiGet.dart';
import 'RsetApiPost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final apiservice = ApiService();
  var dataFromAPI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Reports'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, snapshot) {
          var coData = snapshot.data;
          if (coData == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            var loopData = coData["response"];
            return ListView.builder(
              itemCount: loopData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => Information(
                            loopData[index]["country"].toString(),
                            loopData[index]));
                    Navigator.push(context, route);
                  },
                  title: Text(loopData[index]["country"]),
                );
              },
            );
          }
        },
      ),
    );
  }

  getData() async {
    final result = await RestApiGet().getData();
    setState(() {
      dataFromAPI = result;
    });
    return result;
  }

  postData() async {
    try {
      final postReturn =
          await RestApiPost().postData({"name": "Partha", "city": "Durgapur"});
      print(postReturn);
    } catch (e) {
      print(e.toString());
    }
  }
}
