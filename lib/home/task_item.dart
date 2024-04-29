import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Slidable(
          startActionPane: ActionPane(motion: DrawerMotion(),
              extentRatio: .35,
              children: [
                SlidableAction(onPressed: (context) {

                },
                  autoClose: true,
                  icon: Icons.delete,
                  // label: "Delete",
                  spacing: 10,
                  borderRadius: BorderRadius.only(
                    bottomLeft:  Radius.circular(25),
                    topLeft:  Radius.circular(25),
                  ),
                  backgroundColor: Colors.red,),

                SlidableAction(onPressed: (context) {

                },
                  autoClose: true,
                  icon: Icons.edit,
                  label: "Edit",
                  spacing: 10,
                  backgroundColor: Colors.blue,)

              ]
          ),
          child: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                      height: double.infinity,
                      width: 5,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hello World",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.w400)),
                      Text("10.44",
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
