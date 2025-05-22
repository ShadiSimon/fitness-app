import 'package:assignment2_comp3130/MyApp.dart';
import 'package:assignment2_comp3130/Theme.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Theme_BackGround.initialize();  
  await Theme_Text.initialize();
  runApp(const MyApp());
}


