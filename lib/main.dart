// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:untitled1/excelpage.dart';
import 'package:untitled1/firebase_options.dart';
import 'package:untitled1/network.dart';
import 'package:untitled1/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

String value = "";
List<double> userAccelerometerValuesx = [];
List<String> charlist = [];
List<double> userAccelerometerValuesy = [];
List<double> userAccelerometerValuesz = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: SignInScreen(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(10),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              controller: TextEditingController(text: value),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Row(
            children: [
              TextButton(
                child: Text("A"),
                onPressed: () {
                  addvaltolist("A");
                },
              ),
              TextButton(
                child: Text("B"),
                onPressed: () {
                  addvaltolist("B");
                },
              ),
              TextButton(
                child: Text("C"),
                onPressed: () async {
                  addvaltolist("C");
                },
              ),
              TextButton(
                child: Text("D"),
                onPressed: () {
                  addvaltolist("D");
                },
              ),
              TextButton(
                child: Text("E"),
                onPressed: () {
                  addvaltolist("E");
                },
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Text("F"),
                onPressed: () {
                  addvaltolist("F");
                },
              ),
              TextButton(
                child: Text("G"),
                onPressed: () {
                  addvaltolist("G");
                },
              ),
              TextButton(
                child: Text("H"),
                onPressed: () {
                  addvaltolist("H");
                },
              ),
              TextButton(
                child: Text("I"),
                onPressed: () {
                  addvaltolist("I");
                },
              ),
              TextButton(
                child: Text("J"),
                onPressed: () {
                  addvaltolist("J");
                },
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Text("K"),
                onPressed: () {
                  addvaltolist("K");
                },
              ),
              TextButton(
                child: Text("L"),
                onPressed: () {
                  addvaltolist("L");
                },
              ),
              TextButton(
                child: Text("M"),
                onPressed: () {
                  addvaltolist("M");
                },
              ),
              TextButton(
                child: Text("N"),
                onPressed: () {
                  addvaltolist("N");
                },
              ),
              TextButton(
                child: Text("O"),
                onPressed: () {
                  addvaltolist("O");
                },
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Text("P"),
                onPressed: () {
                  addvaltolist("P");
                },
              ),
              TextButton(
                child: Text("Q"),
                onPressed: () {
                  addvaltolist("Q");
                },
              ),
              TextButton(
                child: Text("R"),
                onPressed: () {
                  addvaltolist("R");
                },
              ),
              TextButton(
                child: Text("S"),
                onPressed: () {
                  addvaltolist("S");
                },
              ),
              TextButton(
                child: Text("T"),
                onPressed: () {
                  addvaltolist("T");
                },
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Text("U"),
                onPressed: () {
                  addvaltolist("U");
                },
              ),
              TextButton(
                child: Text("V"),
                onPressed: () {
                  addvaltolist("V");
                },
              ),
              TextButton(
                child: Text("W"),
                onPressed: () {
                  addvaltolist("W");
                },
              ),
              TextButton(
                child: Text("X"),
                onPressed: () {
                  addvaltolist("X");
                },
              ),
              TextButton(
                child: Text("Y"),
                onPressed: () {
                  addvaltolist("Y");
                },
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Icon(Icons.check),
                onPressed: () async {
                  await enterbutton();
                  //addvaltolist("Z");
                },
              ),
              TextButton(
                child: Text("Z"),
                onPressed: () {
                  addvaltolist("Z");
                },
              ),
              TextButton(
                child: Text("+"),
                onPressed: () {
                  addvaltolist("+");
                },
              ),
              TextButton(
                child: Text("~"),
                onPressed: () {
                  addvaltolist("~");
                },
              ),
              TextButton(
                child: Icon(Icons.backspace_outlined),
                onPressed: () {
                  addvaltolist("back");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  addvaltolist(String cha) {
    switch (cha) {
      case "back":
        try {
          value = value.substring(0, value.length - 1);
        } catch (e) {
          print(e);
        }
        break;
      default:
        value += cha;
    }
    //value += cha;
    print(value);
    setState(() {});
    charlist.add(cha);
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) async {
        userAccelerometerValuesx.add(event.x);
        userAccelerometerValuesy.add(event.y);
        userAccelerometerValuesz.add(event.z);
      },
    );
    createexcel(charlist, userAccelerometerValuesx, userAccelerometerValuesy,
        userAccelerometerValuesz);
    // print(userAccelerometerValuesx);
    // createexcel(cha, userAccelerometerValuesx, userAccelerometerValuesy,
    //     userAccelerometerValuesz);
  }

  var result = "";
  enterbutton() async {
    if (value.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) => SizedBox(
              height: 10, width: 10, child: CircularProgressIndicator()));
      for (int i = 0; i < charlist.length; i++) {
        await Network.getprediction(charlist, userAccelerometerValuesx,
                userAccelerometerValuesy, userAccelerometerValuesz)
            .then((value) => result = value);
      }
      value = "";
      setState(() {});
      Navigator.pop(context);
      var snackBar = SnackBar(
        content: Text(result),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(
        content: Text("Enter any text"),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
