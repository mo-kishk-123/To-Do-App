import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chosenDate = DateTime.now();

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Add New Task",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text("Title",
                  style: TextStyle(fontSize: 22, color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text("Description",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Select Day",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              "${chosenDate.toString().substring(0, 10)}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                )),
          )
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: chosenDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (selectedDate != null) {
      chosenDate = selectedDate!;
      setState(() {});
    }
  }
}
