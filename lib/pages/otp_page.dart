import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sif/components/button.dart';
import 'package:sif/pages/login_page.dart';

import '../components/appbar.dart';
import 'home_page.dart';

class OtpScreen extends StatefulWidget {
  String verificationid;
  final name,organisation,statename,townnmae,userid,phno;
  OtpScreen({super.key, this.phno, this.userid, this.name, this.organisation, this.statename, this.townnmae,required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
   var otp;
print(widget.name);
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 66, 66, 1),
      appBar:const PreferredSize(
        preferredSize:Size.fromHeight(45) ,
        child: appbar(),
      ),
      body: SafeArea(
        child: Column(
          children: [SizedBox(height: 40,),
            Center(
              child: Container(
                child: const Text(
                  "Verification Code ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(239, 242, 42, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                child: Text(
                  "Please Enter the verification code sent \n to +91 ${widget.phno} ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35,),
            Center(
              child: OtpTextField(
                decoration: InputDecoration(
                ),
                styles:[TextStyle(color: Colors.white),
                  TextStyle(color: Colors.white),
                  TextStyle(color: Colors.white),
                  TextStyle(color: Colors.white),
                  TextStyle(color: Colors.white),
                  TextStyle(color: Colors.white),] ,
                focusedBorderColor:Colors.black,
                enabledBorderColor:Color(0xFF222222),
                numberOfFields: 6,
                cursorColor:Colors.white ,
                showFieldAsBox: true,
                onSubmit: (code){otp=code;},
              ),
            ),
            SizedBox(height: 40,),
            MyButton(
                onTap: ()async{
                  try{
                    PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: otp.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    });

                  }
                      catch(ex){}
                },
                text: "Verify")
          ],
        ),
      ),

    );
  }
}
