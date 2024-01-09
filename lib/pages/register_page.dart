import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:sif/components/label.dart';
import 'package:sif/components/textfield.dart';
import 'package:sif/pages/otp_page.dart';
import '../components/appbar.dart';
import '../components/button.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isUserExists = false;

  var phno;

  Future<void> checkAndStoreUserId() async {
    try {
      // Reference to the Firestore collection
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Query to check if the user ID exists
      QuerySnapshot querySnapshot = await users
          .where('PhoneNumber', isEqualTo: mbnumberController.text)
          .get();
      print(querySnapshot.docs);
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          isUserExists = true;
        });
      } else {
        // User does not exist, so add a new documen

        setState(() {
          isUserExists = false;
        });
      }
    } catch (e) {
      print('Error checking and storing user ID: $e');
    }
  }

  final useridController = TextEditingController();
  final namedisController = TextEditingController();
  final mbnumberController = TextEditingController();
  final organisationController = TextEditingController();
  final statenameController = TextEditingController();
  final townnameController = TextEditingController();
  @override
  void displaynull() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            "All Field are requrird",
            style: TextStyle(fontSize: 12),
          ),
        );
      },
    );
  }

  void Userexist() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            "User Already Exists",
            style: TextStyle(fontSize: 12),
          ),
        );
      },
    );
  }

  void correctmobilenumber() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            "Mobile Number Should be of length 10",
            style: TextStyle(fontSize: 12),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 66, 66, 1),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: appbar(),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: const Text(
                    "Your Profile",
                    style: TextStyle(
                      color: Color.fromRGBO(239, 242, 42, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Mylabel(label_text: "User ID"),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  controller: useridController,
                  hintText: "Enter User ID",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                Mylabel(label_text: "Name and Designation"),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  controller: namedisController,
                  hintText: "Enter Name and Designation",
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Mylabel(label_text: "Your Mobile Number"),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 70,
                    child: IntlPhoneField(
                      dropdownTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      initialCountryCode: 'IN',
                      onSaved: (phone) {
                        setState(() {
                          phno = phone?.completeNumber;
                        });
                        // The phone parameter contains the complete phone number.
                      },
                      disableLengthCheck: false,
                      controller: mbnumberController,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: const Color.fromRGBO(34, 34, 34, 1),
                          filled: true,
                          hintText: "Enter Your Mobile Number",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Mylabel(label_text: "Your Organisation"),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  controller: organisationController,
                  hintText: "Enter Your Organisation",
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Mylabel(label_text: "State Name"),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  controller: statenameController,
                  hintText: "Enter State Name",
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Mylabel(label_text: "Town Name"),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  controller: townnameController,
                  hintText: "Enter Town Name",
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: () async {
                    _formKey.currentState?.save();
                    print(phno);
                    // checkUserIdExistence(useridController.text.toString());
                    final userid = useridController.text;
                    final name = namedisController.text;
                    final mobilenumber = mbnumberController.text;
                    final organisation = organisationController.text;
                    final statename = statenameController.text;
                    final townname = townnameController.text;
                    if (mobilenumber != null && mobilenumber.length != 10) {
                      correctmobilenumber();
                    } else if (userid != "" &&
                        name.isNotEmpty &&
                        mobilenumber.isNotEmpty &&
                        organisation.isNotEmpty &&
                        statename.isNotEmpty &&
                        townname.isNotEmpty) {
                      checkAndStoreUserId();
                      if (isUserExists == false) {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException ex) {},
                          codeSent: (String verificationid, int? resendtoken) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpScreen(
                                        phno: phno,
                                        userid: useridController.value.text,
                                        name: namedisController.value.text,
                                        organisation:
                                            organisationController.value.text,
                                        statename:
                                            statenameController.value.text,
                                        townnmae: townnameController.value.text,
                                        verificationid: verificationid,
                                      )),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationid) {},
                          phoneNumber: phno,
                        );
                      } else {
                        print("object");
                        Userexist();
                      }
                    } else {
                      displaynull();
                    }
                  },
                  text: "Register",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Already Register?",
                    style: TextStyle(
                      color: Color.fromRGBO(239, 242, 42, 1),
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
