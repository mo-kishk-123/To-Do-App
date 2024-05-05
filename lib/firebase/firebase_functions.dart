import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTAskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel model) {
    var collection = getTAskCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    var collection = getTAskCollection();
    return collection
        .where("date",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTAskCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    return getTAskCollection().doc(model.id).update(model.toJson());
  }
}
