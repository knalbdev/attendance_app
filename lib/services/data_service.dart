import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  Future<QuerySnapshot> getData() {
    return dataCollection.get();
  }

  Future<void> deteleData(String docId) {
    return dataCollection.doc(docId).delete();
  }
}