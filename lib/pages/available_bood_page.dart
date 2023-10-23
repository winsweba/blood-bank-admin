import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/all_blood.dart';
import '../models/report_model.dart';
import '../pages/dornor_details_page.dart';

class AvailableBloodPage extends StatefulWidget {
  const AvailableBloodPage({super.key});

  @override
  State<AvailableBloodPage> createState() => _AvailableBloodPageState();
}

class _AvailableBloodPageState extends State<AvailableBloodPage> {
  // final CollectionReference _postedReport =
  //     FirebaseFirestore.instance.collection("report");
  // final CollectionReference _postedReport = FirebaseFirestore.instance.collection("report").orderBy("name", descending: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<AllBloodModel>>(
        stream: getAllReport(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            // final report = snapshots.data!;

            return SizedBox(
              height: 400,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshots.data!.length,
                  itemBuilder: (context, index) {
                    var tSnapshot = snapshots.data![index];
                    // var time = timeago.format(tSnapshot.timestamp.toDate());
                    // var t = tSnapshot.timestamp as Timestamp;
                    // var dateToTime = t.toDate();
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGAp} :-   ${tSnapshot.amountAp} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGAm} :-   ${tSnapshot.amountAm} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGBp} :-   ${tSnapshot.amountBp} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGBm} :-   ${tSnapshot.amountBm} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGABp} :-   ${tSnapshot.amountABp} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGABm} :-   ${tSnapshot.amountABm} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGOp} :-   ${tSnapshot.amountOp} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Group ${tSnapshot.bloodGOm} :-   ${tSnapshot.amountOm} Unit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => DonorDetailsPage(
                                //       title: "Donor Details",
                                //       donorAge: tSnapshot.donorAge,
                                //       donorLocation: tSnapshot.donorLocation,
                                //       donorName: tSnapshot.donorName,
                                //       donorPhone: tSnapshot.donorPhone,
                                //       locationLat: tSnapshot.locationLat,
                                //       locationLong: tSnapshot.locationLong,
                                //       gender: tSnapshot.gender,
                                //       timestamp: tSnapshot.timestamp,
                                //       bloodGroup: tSnapshot.bloodGroup,
                                //     ),
                                //   ),
                                // );
                              },
                              child: const Text('See Donor Details'),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Stream<List<AllBloodModel>> getAllReport() => FirebaseFirestore.instance
      .collection("availableBlood")
      // .orderBy("timestamp", descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => AllBloodModel.fromJson(doc.data()))
          .toList());
}
