import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index =0 ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFDFECDB)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 157,
          backgroundColor: Color(0xFF5D9CEC),
          title: Text("To Do List",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: (){

        },
            child: Icon(Icons.add,
            color: Colors.white,
            size: 40,),
        backgroundColor: Colors.blue,
            elevation: 0,
        shape: CircleBorder(
          side: BorderSide(color: Colors.white,width: 2.5,
          style: BorderStyle.solid),
        )),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 2,
          child: BottomNavigationBar(
            currentIndex: index,
              onTap: (value) {
              index=value;
              setState(() {

              });
              },
              backgroundColor: Colors.white,
              selectedIconTheme: IconThemeData(color: Colors.blue),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.task), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
              ]),
        ),
      ),
    );
  }
}
