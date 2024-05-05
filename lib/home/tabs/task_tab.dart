import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/firebase/firebase_functions.dart';
import 'package:to_do_app/home/task_item.dart';
import 'package:to_do_app/task_model.dart';

class TaskTab extends StatefulWidget {
  static const String routeName = "TAsks";

  TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: selectedDate,
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          height: 80,
          locale: "en",
          daysCount: 30,
          onDateChange: (date) {
            selectedDate = date;
            setState(() {});
          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseFunctions.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                );
              }
              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if(tasks.isEmpty){
                return Center(child: Text("No Tasks",
                style: TextStyle(fontWeight: FontWeight.w500,
                fontSize: 25),));
              }
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 6,
                ),
                itemBuilder: (context, index) {
                  return TaskItem(
                    taskModel: tasks[index],
                  );
                },
                itemCount: tasks.length,
              );
            },
          ),
        )
      ],
    );
  }
}
