import 'package:flutter/material.dart';
import 'dart:convert';
import 'productsClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutterappppp/products.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController codeController = TextEditingController();
  List<Products> products = List();
  // ignore: non_constant_identifier_names
  String Imageuri;

  Future<List<Products>> displayProduct(String code) async {
    final String apiUrl = "http://164.52.197.189:8181/fdb/prudle/db001/query";
    final response = await http.post(apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "select": {
            "?group": [
              "barcodeValue",
              "productName",
              "productVariant",
              "productImage",
              "productPrice"
            ]
          },
          "where": [
            ["?group", "productDetails/barcodeValue", code]
          ]
        }));

    if (response.statusCode == 200) {
      final String responseString = response.body;
      debugPrint("samie" + responseString);
      return productsFromJson(responseString);
    } else {
      return null;
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(
                  controller: codeController,
                  // the barcode here must be first saved in the database.
                  decoration: InputDecoration(hintText: 'Enter the barcode'),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    child: getListItems(),
                  ) /*ListTile(
                title: Card(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                       //image: DecorationImage(image: NetworkImage(Imageuri))
                    ),
                  ),
                ),
              )*/
                  ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final String code = codeController.text;
        products = await displayProduct(code);
        setState(() {
          debugPrint(products[0].productDetailsProductImage);
          Imageuri = products[0].productDetailsProductImage;
        });
      }),
    );
  }

  ListView getListItems() {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image(
                image:
                    NetworkImage(products[position].productDetailsProductImage),
                fit: BoxFit.cover,
                /*backgroundColor: Colors.red,
                    child: Text((position+1).toString(),
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),*/
              ),
              title: Text(
                products[position].productDetailsProductName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("ID: " + products[position].id.toString()),
                    Text("Varient: " +
                        products[position].productDetailsProductVariant),
                    Text("Price: " +
                        products[position]
                            .productDetailsProductPrice
                            .toString()),
                  ],
                ),
              ) /*Text(products[position].productDetailsProductVariant)*/,
              onTap: () {
                //debugPrint("Tapped on"+position.toString());
                //NavigateToDetails(lists[position]);
                //debugPrint(lists[position].password);
              },
            ),
          );
          /*return ListTile(
                  title: Card(
                  child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(products[position].productDetailsProductImage))
              ),
              ),
              )
              );*/
        });
  }
}
