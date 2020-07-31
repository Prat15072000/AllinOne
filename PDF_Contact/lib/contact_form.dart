import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var _emailFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CONTACT US"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _emailFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                  margin: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter email id";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email Id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ))),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                  margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: TextFormField(
                    controller: numberController,
                    validator: (value) {
                      if (value.isEmpty || value.length != 10) {
                        return "please enter number";
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Contact Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ))),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                  margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter name";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: RaisedButton(
                      color: Colors.yellow,
                      child: Text("Send"),
                      onPressed: () {
                        if (_emailFormKey.currentState.validate()) {
                          sendMessage();
                          //function to send data in the firebase
                          sendToServer();
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendMessage() {
    var PhoneNumber;
    String Name;
    String Emailid;
    Email email;
    setState(() {
      Emailid = emailController.text;
      Name = nameController.text;
      PhoneNumber = numberController.text;
      String messageBody = '$Name \n $PhoneNumber \n $Emailid';
      if (Name.isNotEmpty && Emailid.isNotEmpty && PhoneNumber.isNotEmpty) {
        email = Email(
          body: messageBody,
          subject: 'Email subject',
          recipients: ['info@redpositive.in.'],
        );
        send(email);
      }
    });
    debugPrint('name -> $Name, number -> $PhoneNumber, emailid -> $Emailid');
  }

  void send(Email email) async {
    await FlutterEmailSender.send(email);
  }

  void sendToServer() {
    String cusname;
    var cusnum;
    String id;
    setState(() {
      id = emailController.text;
      cusname = nameController.text;
      cusnum = numberController.text;
      if (_emailFormKey.currentState.validate()) {
        //No error in validator
        _emailFormKey.currentState.save();
        Firestore.instance.runTransaction((Transaction transaction) async {
          CollectionReference reference =
              Firestore.instance.collection('contact');

          await reference.add({
            "Name": "$cusname",
            "Phone Number": "$cusnum",
            "Email Id": "$id"
          });
        });
      } else {
        // validation error
        setState(() {
          // _validate = true;
        });
      }
    });
  }
}
