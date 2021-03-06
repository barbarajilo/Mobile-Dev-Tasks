import 'dart:convert';
import 'package:exercise_day4/MockDataList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: Text('Flutter Layout Chat List')),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightBlue,
                Colors.deepPurple,
              ],
            )),
            child: FutureBuilder(
              future: readJsonData(),
              //data that has been read{
              builder: (context, data) {
                //this if condition is executed when there are erros when reading
                //json file
                if (data.hasError) {
                  return Center(
                    child: Text("${data.error}"),
                  );
                } else if (data.hasData) {
                  var items = data.data as List<MockDataList>;
                  return ListView.builder(
                      itemCount: items.isEmpty ? 0 :items.length,// 
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                    image: NetworkImage(
                                      items[index].avatar == null
                                          ? 'https://static.thenounproject.com/png/3134331-200.png'
                                          : items[index].avatar.toString(),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 8),
                                          child: Text(
                                            items[index].firstName.toString() +
                                                " " +
                                                items[index]
                                                    .lastName
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 8),
                                          child: Text(
                                            items[index].username.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 8),
                                          child: Text(
                                            items[index].status == null
                                                ? 'Status'
                                                : items[index]
                                                    .status
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            items[index].lastSeen.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(
                                              items[index].messages == null
                                                  ? ' '
                                                  : items[index]
                                                      .messages
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ));
  }

  //This function will be used to read json file
  //It will take time, hence use Future
  //async is type of Future
  //List<dynamic> tempVar = [];
  Future<List<dynamic>> readJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/mock-data.json');
    //data from json file has been read and stored in the list
    final list = json.decode(jsondata) as List<dynamic>;
    //now return the list
    return list.map((e) => MockDataList.fromJson(e)).toList();
  }

}
