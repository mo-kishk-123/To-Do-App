import 'package:flutter/material.dart';
import 'package:to_do_app/home/tabs/task_tab.dart';
import 'package:to_do_app/home/add_task_bottom_sheet.dart';
import 'package:to_do_app/home/tabs/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFDFECDB)),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xFF5D9CEC),
          title: Text("To Do List",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddTaskBottomSheet());
                  });
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
            backgroundColor: Colors.blue,
            elevation: 0,
            shape: CircleBorder(
              side: BorderSide(
                  color: Colors.white, width: 2.5, style: BorderStyle.solid),
            )),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          padding: EdgeInsets.zero,
          height: 60,
          notchMargin: 5,
          color: Colors.white,
          child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
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
        body: tabs[index],
      ),
    );
  }

  List<Widget> tabs = [TaskTab(), SettingTab()];
}
