import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recognition/services/data_service.dart';
import 'package:flutter/material.dart';

class _AttendanceHistoryScreenState extends StatefulWidget {
  const _AttendanceHistoryScreenState({super.key});

  @override
  State<_AttendanceHistoryScreenState> createState() => __AttendanceHistoryScreenStateState();
}

class __AttendanceHistoryScreenStateState extends State<_AttendanceHistoryScreenState> {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance History"),
      ),
      body: StreamBuilder(
        stream: dataService.dataCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("There is no data."),
            );
          }

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              // TODO: put attendance card UI here
            },
          );
        },
      ),
    );
  }
}