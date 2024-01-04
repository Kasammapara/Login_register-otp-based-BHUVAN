import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final useridController = TextEditingController();
  final namedisController = TextEditingController();
  final mbnumberController = TextEditingController();
  final organisationController = TextEditingController();
  final statenameController = TextEditingController();
  final townnameController = TextEditingController();

  void displaynull(){
  showDialog(context: context, builder: (context){
    return const AlertDialog(
      title: Text("All Field are requrird",
      style: TextStyle(
        fontSize: 12
      ),
      ),
    );
  },);
}
  void correctmobilenumber(){
    showDialog(context: context, builder: (context){
      return const AlertDialog(
        title: Text("Mobile Number Should be of length 10",
          style: TextStyle(
              fontSize: 12
          ),
        ),
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 66, 66, 1),
          appBar:const PreferredSize(
            preferredSize:Size.fromHeight(45) ,
            child: appbar(),
          ),


      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [SizedBox(height: 20,),Container(
              child: const Text(
                "Your Profile",
                style: TextStyle(
                  color: Color.fromRGBO(239, 242, 42, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              SizedBox(height: 30,),
              Mylabel(label_text: "User ID"),
              SizedBox(height: 5,),
              MyTextField(
                controller: useridController,
                hintText: "Enter User ID",
                obscureText: false,
                keyboardType:  TextInputType.number,
              ),
              SizedBox(height: 10,),
              Mylabel(label_text: "Name and Designation"),
              SizedBox(height: 5,),
              MyTextField(
                controller: namedisController,
                hintText: "Enter Name and Designation",
                obscureText: false,
              ),
              SizedBox(height: 10,),
              Mylabel(label_text: "Your Mobile Number"),
              SizedBox(height: 5,),
              MyTextField(
                controller: mbnumberController,
                hintText: "Enter Your Mobile Number",
                obscureText: false,
              ),
              SizedBox(height: 10,),
              Mylabel(label_text: "Your Organisation"),
              SizedBox(height: 5,),
              MyTextField(
                controller: organisationController,
                hintText: "Enter Your Organisation",
                obscureText: false,
              ),
              SizedBox(height: 10,),
              Mylabel(label_text: "State Name"),
              SizedBox(height: 5,),
              MyTextField(
                controller: statenameController,
                hintText: "Enter State Name",
                obscureText: false,
              ),
              SizedBox(height: 10,),
              Mylabel(label_text: "Town Name"),
              SizedBox(height: 5,),
              MyTextField(
                controller: townnameController,
                hintText: "Enter Town Name",
                obscureText: false,
              ),
              SizedBox(height: 30,),
              MyButton(
                onTap: ()async{
                  final userid = useridController.text;
                  final name = namedisController.text;
                  final mobilenumber = mbnumberController.text;
                  final organisation = organisationController.text;
                  final statename = statenameController.text;
                  final townname = townnameController.text;
                  if (userid != "" && name.isNotEmpty && mobilenumber.isNotEmpty && organisation.isNotEmpty && statename.isNotEmpty && townname.isNotEmpty  ) {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (
                          PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationid, int? resendtoken) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OtpScreen(
                                    phno: mbnumberController.value.text,
                                    userid: useridController.value.text,
                                    name: namedisController.value.text,
                                    organisation: organisationController.value.text,
                                    statename: statenameController.value.text,
                                    townnmae: townnameController.value.text,
                                    verificationid: verificationid,
                                  )),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationid) {},
                      phoneNumber: mbnumberController.text.toString(),
                    );
                  }
                  else if(mobilenumber!=null&&mobilenumber.length!=10){
                        correctmobilenumber();
                      }
                      else{
                        displaynull();
                      }
                },
                text: "Register",
              ),
              GestureDetector(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  LoginPage()),
                );},
                child: Text("Already Register?"
                ,style: TextStyle(
                    color:Color.fromRGBO(239, 242, 42, 1),
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
