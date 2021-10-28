import 'package:flutter/material.dart';
//import 'package:flutter'

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownValue = 'Gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MD Day-3 Project'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Welcome Besquare!',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w800,
                          fontSize: 30),
                    )),
                Image.asset(
                  "assets/images/logo.png",
                  height: 180,
                  width: 180,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_circle),
                    iconSize: 26,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Gender', 'Female', 'Male', 'Unknown']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                Container(
                    width: 150,
                    padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                        print(dropdownValue);

                        final snackBar = SnackBar(
                          content: const Text('You have been sign up successfully!'),
                          action: SnackBarAction(
                          label: 'close',
                          onPressed: () {
                          // Some code to undo the change.
                          },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                      ScaffoldMessenger.of(this.context).showSnackBar(snackBar);
                      },
                    )),
              ],
            ))));
  }
}
