
import 'package:assignment2_comp3130/Parking.dart';
import 'package:assignment2_comp3130/SideBar.dart';
import 'package:flutter/material.dart';

import 'Theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme_BackGround.getColor(),
      appBar: AppBar(
        title: const Text('MQ'),
        backgroundColor: Colors.red[800],
        toolbarHeight: 75,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:200),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text('Welcome to Macquarie University CarPark',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Theme_Text.getColor()),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 50, width: 150,
              child:
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParkingPage()));
              },
              child: const Text('Find Parking'),
            ),
          ),
          ],
        ),
      ),
      drawer: const SideBar(screen: HomePage(),),
    );
  }
}