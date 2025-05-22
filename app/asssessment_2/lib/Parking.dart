
import 'package:assignment2_comp3130/Result.dart';
import 'package:assignment2_comp3130/SideBar.dart';
import 'package:assignment2_comp3130/Theme.dart';
import 'package:flutter/material.dart';

class ParkingPage extends StatelessWidget {
  const ParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme_BackGround.getColor(),
      extendBody: true,
      appBar: AppBar(
        title: const Text('MQ'),
        backgroundColor: Colors.red[800],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30),
                child: Text('Choose Parking Space',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme_Text.getColor()),)
              ),
              SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset(
                    'assets/your_image_here.jpg',
                    fit: BoxFit.cover,
                  )),

              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text('Available Spaces:',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme_Text.getColor()),
              ),
              ),
              SizedBox(
                width: 500,
                child: ParkingOptions(onSelectAnswer: (String answer) {}),
              ),
            ],
          ),
        ),
      ),
      drawer: const SideBar(screen: ParkingPage()),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Theme_BackGround.getColor(),),
        child: Center( child : Text('Please Select Parking Spot' ,style: TextStyle(color: Theme_Text.getColor() ),
          )
      )));
  }
}



class ParkingOptions extends StatefulWidget {
  const ParkingOptions({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<ParkingOptions> createState() {
    return _ParkingOptions();
  }
}

class _ParkingOptions extends State<ParkingOptions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carPark
              .map((parkingBuilding) => buildParkingOptions(parkingBuilding))
              .toList(),
        ),
      ),
    );
  }

  Widget buildParkingOptions(ParkingList parkingBuilding) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        
        Text(
          parkingBuilding.carParkBuilding,
          style: const TextStyle(
              color: Color.fromARGB(255, 135, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        ...parkingBuilding.getCarSpaceList().map((space) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 161, 0, 0),
                border: Border.all(color: const Color.fromARGB(255, 68, 0, 0)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ChoiceButton(
                answerText: space,
                onAnswerSelect: () {

                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsScreen(parkingLot: parkingBuilding.carParkBuilding, parkingSpot: space,
                        )));
                
                },
              ));
        }),
        const SizedBox(height: 50),
      ],
    );
  }
}



class ParkingList {
  final String carParkBuilding;
  final List<String> carParkSpaces;

  ParkingList(this.carParkBuilding, this.carParkSpaces);

  List<String> getCarSpaceList() => carParkSpaces;
}

class ChoiceButton extends StatelessWidget {
  const ChoiceButton(
      {super.key, required this.answerText, required this.onAnswerSelect});

  final String answerText;
  final void Function() onAnswerSelect;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onAnswerSelect,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
            backgroundColor: const Color.fromARGB(255, 157, 27, 27),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}




List<ParkingList> carPark = [
  ParkingList("Link Road ParkingLot - \$5/h", [
    "Car Space 1 (Disability) ",
    "Car Space 5",
    "Car Space 8",
    'Car Space 9',
  ]),
  ParkingList("Western Road ParkingLot - \$9/h", [
    "Car Space 11",
    "Car Space 25",
    "Car Space 46",
  ]),
  ParkingList("Eastern Road ParkingLot - \$10/h", [
    "Car Space 1 (Disability)",
    "Car Space 3 (Disability)",
    "Car Space 8",
    "Car Space 12",
    "car Space 17"
  ]),
  ParkingList("Research Park Drive ParkingLot - \$11/h", [
    "Car Space 22",
    "Car Space 28",
    "Car Space 46",
  ]),
  ParkingList("Culloden Road ParkingLot - \$6/h", [
    "Car Space 7",
    "Car Space 10",
    "Car Space 15",
  ]),
  ParkingList("Gymnasium Road ParkingLot - \$5/h", [
    "Car Space 1",
    "Car Space 5",
    "Car Space 14",
  ]),
];
