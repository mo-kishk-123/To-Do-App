import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/auth/auth.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/home/home.dart';
import 'package:to_do_app/home/tabs/setting_tab.dart';
import 'package:to_do_app/home/tabs/task_tab.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AuthScreen.routeName,
      routes: {
        AuthScreen.routeName : (context)=> AuthScreen(),
        HomeScreen.routeName : (context)=> HomeScreen(),
        TaskTab.routeName : (context)=> TaskTab(),
        SettingTab.routeName : (context)=> SettingTab(),
      },
    );
  }
}