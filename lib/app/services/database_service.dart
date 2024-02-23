import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference get todoCollection => firestore.collection("todo");
  CollectionReference get users => firestore.collection('users');
}
