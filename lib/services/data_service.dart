import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  Future<QuerySnapshot> getData() {
    // untuk mendapatkan/membaca data dari database
    return dataCollection.get();
  }

  Future<void> deteleData(String docId) {
    // untuk menghapus data dari database 
    return dataCollection.doc(docId).delete();
  }
}