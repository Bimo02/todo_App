import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
      fromFirestore: ((snapshot, options) => Task.FromJson(snapshot.data()!)),
      toFirestore: (task, options) => task.toJson());
}
Future<void> addTaskToFireStore(Task task) async{
  var taskCollection = getTaskCollection();
  var docRef =taskCollection.doc();
  task.id = docRef.id; // auto Gen
  return docRef.set(task);
}
Future<void>deleteTaskFromFireStore(Task task)async{
 return getTaskCollection().doc(task.id).delete();
}