import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/home/task_item.dart';

class TaskTab extends StatelessWidget {
  static const String routeName = "TAsks";
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          height: 80,
          locale: "en",
          daysCount: 30,
          onDateChange: (date) {
            // New date selected
            // setState(() {
            //   _selectedValue = date;
            // }
            // );
          },
        ),
        
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 6,
            ),
            itemBuilder: (context, index) {
            return TaskItem();
          },
          itemCount: 15,),
        )
      ],
    );
  }
}
