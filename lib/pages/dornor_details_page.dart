import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maps_launcher/maps_launcher.dart';
// import 'package:video_player/video_player.dart';

class DonorDetailsPage extends StatefulWidget {
  final String locationLat;
  final String locationLong;
  final String gender;
  final String donorAge;
  final String donorLocation;
  // final String uid;
  final Timestamp timestamp;
  final String donorPhone;
  final String donorName;
  final String bloodGroup;
  final String title;
  const DonorDetailsPage(
      {super.key,
      required this.donorAge,
      required this.donorLocation,
      required this.donorPhone,
      required this.donorName,
      required this.locationLat,
      required this.locationLong,
      required this.gender,
      required this.bloodGroup,
      required this.timestamp,
      required this.title});
  // const DonorDetailsPage({super.key, required this.locationLat, required this.locationLong, required this.fileSend, required this.messageReported, required this.reporterLocation, required this.uid, required this.reporterPhone, required this.reporterName});

  @override
  State<DonorDetailsPage> createState() => _DonorDetailsPageState();
}

class _DonorDetailsPageState extends State<DonorDetailsPage> {
  var dateToTime;

  @override
  void initState() {
    super.initState();
    var t = widget.timestamp;
    dateToTime = t.toDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(time),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Date:-${dateToTime.month}-${dateToTime.day}-${dateToTime.year}',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              'Time:-${dateToTime.hour}:${dateToTime.minute}:${dateToTime.second}')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Donor Name::",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.donorName,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Donor Age::",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.donorAge,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Gender::",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      widget.gender == "1"
                          ? Text(
                              "Other",
                              style: const TextStyle(fontSize: 16),
                            )
                          : widget.gender == "2"
                              ? Text("MALE")
                              : Text("FEMALE"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Blood Group::",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.bloodGroup,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phone No.:: ${widget.donorPhone}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Donor Location:: ${widget.donorLocation}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blueAccent),
                  child: Text(
                    "view donor location ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    if (widget.locationLat == "null" ||
                        widget.locationLong == "null") {
                      Fluttertoast.showToast(
                        msg: "Location is not Given",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 14.0,
                      );
                      return;
                    }
                    double lat = double.parse(widget.locationLat);
                    double long = double.parse(widget.locationLong);
                    MapsLauncher.launchCoordinates(
                        lat, long, 'Google Headquarters are here');
                    // print(widget.locationLat);
                    // print(widget.locationLong);
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
