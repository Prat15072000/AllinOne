import 'package:flutter/material.dart';

class Design extends StatefulWidget {
  get title => null;

  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 350.0),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
              ),
              SizedBox(
                height: h / 30,
              ),
              Stack(children: [
                Container(
                  height: h / 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Stack(children: [
                    Positioned(
                        left: 170,
                        child: Container(
                          height: h / 8,
                          width: w / 5,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://img.favpng.com/14/8/10/business-information-service-royalty-free-organization-png-favpng-3wQBUKFxeJDqGgtz43Cfz36bB.jpg'))),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Column(
                        children: [
                          Text(
                            'Sarah Blake',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Certified Teacher',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: h / 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Stack(children: [
                                      Container(
                                        height: h / 11,
                                        width: w / 6,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                      Container(
                                        height: h / 11.5,
                                        width: w / 6.5,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 8, 8, 8),
                                          child: Image.network(
                                            'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'Math',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Subject',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Stack(children: [
                                      Container(
                                        height: h / 11,
                                        width: w / 6,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                      Container(
                                        height: h / 11.5,
                                        width: w / 6.5,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 8, 8, 8),
                                          child: Image.network(
                                            'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        '5 years',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Experience',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Stack(children: [
                                      Container(
                                        height: h / 11,
                                        width: w / 6,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                      Container(
                                        height: h / 11.5,
                                        width: w / 6.5,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 8, 8, 8),
                                          child: Image.network(
                                            'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        '60/hr',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h / 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 330, 0),
                            child: Text(
                              'About',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 50, 10),
                            child: Text(
                              'Hi my name is Pratyay Sinha, I have been working in flutter from past 8 months and still learning. I have so far used firebase and laravel as backend services and heve integrated various API and cloud functions to applications as well',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Review',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h / 30,
                          ),
                          Card(
                            child: ListTile(
                              leading: Image.network(
                                  "https://images.pexels.com/photos/3938343/pexels-photo-3938343.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                              title: Text(
                                '"Amazing Lessons"',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '-Ryan',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Container(
                                height: h / 19,
                                width: w / 6,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'See All',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h / 20,
                          ),
                          Center(
                            child: Container(
                              height: h / 12,
                              width: w / 1.3,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.shopping_basket,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                    'Schedule a lesson',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ])
            ],
          ),
        ])),
      ),
    );
  }
}

