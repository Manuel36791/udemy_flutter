import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
            onPressed: onNotification,
            icon: Icon(
              Icons.notification_important,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Hello');
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      // body: Container(
      //   color: Colors.purpleAccent,
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         color: Colors.red,
      //         child: Text(
      //           'First Text',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 30.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.green,
      //         child: Text(
      //           'Second Text',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 30.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.blue,
      //         child: Text(
      //           'Third Text',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 30.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.amber,
      //         child: Text(
      //           'Fourth Text',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 30.0,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // body: Container(
      //   color: Colors.purpleAccent,
      //   height: double.infinity,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       Container(
      //         color: Colors.red,
      //         child: Text(
      //           'First',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 20.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.green,
      //         child: Text(
      //           'Second',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 20.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.blue,
      //         child: Text(
      //           'Third',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 20.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.amber,
      //         child: Text(
      //           'Fourth',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 20.0,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     //crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'First',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Second',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Third',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Fourth',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'First',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Second',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Third',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Fourth',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'First',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Second',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Third',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Fourth',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'First',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Second',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Third',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Fourth',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'First',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Second',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Third',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         'Fourth',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(
                    20.0,
                  ),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://brooklynintergroup.org/brooklyn/wp-content/uploads/2021/01/flower-729512__340-1.jpg'),
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.7),
                    width: 200.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

void onNotification() {
  print('Notification Clicked');
}
