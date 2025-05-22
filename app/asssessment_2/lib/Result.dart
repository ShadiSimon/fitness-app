
import 'package:assignment2_comp3130/Home.dart';
import 'package:assignment2_comp3130/Parking.dart';
import 'package:assignment2_comp3130/SideBar.dart';
import 'package:assignment2_comp3130/Theme.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen(
      {super.key, required this.parkingLot, required this.parkingSpot});

    final String parkingLot;
    final String parkingSpot;
    

    @override
    State<ResultsScreen> createState() => _ResultsScreen();
  }

  class _ResultsScreen extends State<ResultsScreen> {
  bool paid = false;

  void pay(){
    paid = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme_BackGround.getColor(),
        appBar: AppBar(
          title: const Text('MQ'),
          backgroundColor: Colors.red[800],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text('Order Parking Spot',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme_Text.getColor())),
              ),
                Container(
                    width: 400,
                    color: Color.fromARGB(255, 197, 197, 197),
                    margin: const EdgeInsets.all(30),
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container( decoration: BoxDecoration ( 
                                    border:Border.all(
                                      color: const Color.fromARGB(255, 45, 45, 45),
                                      width: 2),),
                        child:
                        Padding(padding: EdgeInsets.all(60),
                        child: SizedBox(
                          
                          height: 200, 
                          child: Container(
                            
                              width: 650,
                            child: Column(
                              
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(
                                  child: Column(children: [
                                Text('Parking Lot : '+ widget.parkingLot, 
                                textAlign: TextAlign.start,),
                                Text('Parking Spot : '+ widget.parkingSpot,
                                textAlign: TextAlign.start,),
                                
                      ]) ),   
                                Padding(
                                  padding: EdgeInsets.only(top:90),
                                  child: ElevatedButton(
                                   onPressed: () {
                                    setState(
                                      pay
                                    );
                                   },
                                  child: const Text('Click To Pay'),),
                                ),
                                
                              ]
                       )
                    
                
                        ),
                    )
                  ),
                      
                    )],
        ),
        ),
          if (paid) Text('Transaction successful' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Theme_Text.getColor())), 

        ]),
        ),
        drawer: const SideBar(screen: ParkingPage()),
        bottomNavigationBar: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage()));
          },
          child: Text('Return Home'),
        ),
      ),
        );
  }
}