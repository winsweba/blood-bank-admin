import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditAvailableDetailsPage extends StatefulWidget {
  final String amountAp;
  final String amountAm;
  final String amountBp;
  final String amountBm;
  final String amountABp;
  final String amountABm;
  final String amountOp;
  final String amountOm;
  final String id;
  const EditAvailableDetailsPage({
    super.key,
    required this.amountAp,
    required this.amountAm,
    required this.amountABm,
    required this.amountABp,
    required this.amountBm,
    required this.amountBp,
    required this.amountOm,
    required this.amountOp,
    required this.id,
  });

  @override
  State<EditAvailableDetailsPage> createState() =>
      _EditAvailableDetailsPageState();
}

class _EditAvailableDetailsPageState extends State<EditAvailableDetailsPage> {
  TextEditingController _controllerAp = TextEditingController();
  TextEditingController _controllerAm = TextEditingController();
  TextEditingController _controllerBp = TextEditingController();
  TextEditingController _controllerBm = TextEditingController();
  TextEditingController _controllerABp = TextEditingController();
  TextEditingController _controllerABm = TextEditingController();
  TextEditingController _controllerOp = TextEditingController();
  TextEditingController _controllerOm = TextEditingController();
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerAp.text = widget.amountAp;
    _controllerAm.text = widget.amountAm;
    _controllerBp.text = widget.amountBp;
    _controllerBm.text = widget.amountBm;
    _controllerABp.text = widget.amountABp;
    _controllerABm.text = widget.amountABm;
    _controllerOp.text = widget.amountOp;
    _controllerOm.text = widget.amountOm;
  }

  Future<void> _addToFirebase() async {
    if (!_formKey.currentState!.validate()) return;
    String amountAp = _controllerAp.value.text.trim();
    String amountAm = _controllerAm.value.text.trim();
    String amountBp = _controllerBp.value.text.trim();
    String amountBm = _controllerBm.value.text.trim();
    String amountABp = _controllerABp.value.text.trim();
    String amountABm = _controllerABm.value.text.trim();
    String amountOp = _controllerOp.value.text.trim();
    String amountOm = _controllerOm.value.text.trim();

    FirebaseFirestore db = FirebaseFirestore.instance;

    setState(() {
      _loading = true;
    });

    try {
      final donorUpdate = db.collection("availableBlood").doc(widget.id);

      await donorUpdate.update({
        "amountAp": amountAp,
        "amountAm": amountAm,
        "amountBp": amountBp,
        "amountBm": amountBm,
        "amountABp": amountABp,
        "amountABm": amountABm,
        "amountOp": amountOp,
        "amountOm": amountOm,
      });

      Fluttertoast.showToast(
          msg: "Updated Successfully ",
          // msg: "${e.toString().replaceRange(0, 14, '').split(']')[1]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // developer.log("message Successfully");
    } catch (e) {
      // developer.log("message error:: $e");
      Fluttertoast.showToast(
          msg: "Please check Your internet connection ",
          // msg: "${e.toString().replaceRange(0, 14, '').split(']')[1]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit here"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Blood Group A+",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerAp,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group A+"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Blood Group A-",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerAm,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group A-"),
                      ),
                    ),
                  ),
                  Text(
                    "Blood Group B+",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerBp,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group B+"),
                      ),
                    ),
                  ),
                  Text(
                    "Blood Group B-",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerBm,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group B-"),
                      ),
                    ),
                  ),
                  Text(
                    "Blood Group AB+",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerABp,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group AB+"),
                      ),
                    ),
                  ),
                  Text(
                    "Blood Group AB-",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerABm,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group AB-"),
                      ),
                    ),
                  ),
                  Text(
                    "Blood Group O+",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerOp,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group O+"),
                      ),
                    ),
                  ),
                  Text(
                    "Blood Group O-",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: _controllerOm,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                              ), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Blood Group O-"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addToFirebase();
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0)),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent),
              // child: const Text("Update"),
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
