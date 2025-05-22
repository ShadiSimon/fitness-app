
import 'package:assignment2_comp3130/Theme.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.screen});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme_BackGround.getColor(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[800],
              ),
              child: Text(
                'Preferences',
                style: TextStyle(
                  color: Theme_BackGround.getColor(),
                  fontSize: 24,
                ),
              ),
            ),
            
            Padding(padding: EdgeInsets.all(10),
            child:
            ListTile(
              tileColor: Color.fromARGB(255, 206, 206, 206),
              title: const Text('Light Mode'),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screen,
                    ),); 
                await Theme_Text.setColor('black');
                await Theme_BackGround.setColor('white');
                },
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.all(10),
              child:
              ListTile(
                tileColor : Color.fromARGB(255, 206, 206, 206),
                title: const Text('Dark Mode'),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screen,
                    ),);
                  await Theme_Text.setColor('white');
                  await Theme_BackGround.setColor('black');
                },
                ),
            ),
            
          ],
        ),
    );
  }
}
