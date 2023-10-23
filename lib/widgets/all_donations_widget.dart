import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/report_model.dart';
import '../pages/dornor_details_page.dart';

class AllDonationsWidget extends StatefulWidget {
  const AllDonationsWidget({super.key});

  @override
  State<AllDonationsWidget> createState() => _AllDonationsWidgetState();
}

class _AllDonationsWidgetState extends State<AllDonationsWidget> {
  // final CollectionReference _postedReport =
  //     FirebaseFirestore.instance.collection("report");
  // final CollectionReference _postedReport = FirebaseFirestore.instance.collection("report").orderBy("name", descending: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ReportModel>>(
        stream: getAllReport(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            // final report = snapshots.data!;

            return ListView.builder(
                itemCount: snapshots.data!.length,
                itemBuilder: (context, index) {
                  var tSnapshot = snapshots.data![index];
                  var time = timeago.format(tSnapshot.timestamp.toDate());
                  var t = tSnapshot.timestamp as Timestamp;
                  var dateToTime = t.toDate();
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          // Text(date.day.toString()),
                          Text(
                            time,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Date:-${dateToTime.month}-${dateToTime.day}-${dateToTime.year}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Time:-${dateToTime.hour}:${dateToTime.minute}:${dateToTime.second}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            tSnapshot.donorName,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            tSnapshot.bloodGroup,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            tSnapshot.donorLocation,
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DonorDetailsPage(
                                    title: "Donor Details",
                                    donorAge: tSnapshot.donorAge,
                                    donorLocation: tSnapshot.donorLocation,
                                    donorName: tSnapshot.donorName,
                                    donorPhone: tSnapshot.donorPhone,
                                    locationLat: tSnapshot.locationLat,
                                    locationLong: tSnapshot.locationLong,
                                    gender: tSnapshot.gender,
                                    timestamp: tSnapshot.timestamp,
                                    bloodGroup: tSnapshot.bloodGroup,
                                  ),
                                ),
                              );
                            },
                            child: const Text('See Donor Details'),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Stream<List<ReportModel>> getAllReport() => FirebaseFirestore.instance
      .collection("donating")
      .orderBy("timestamp", descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ReportModel.fromJson(doc.data()))
          .toList());
}
