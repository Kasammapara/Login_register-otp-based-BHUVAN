import 'package:flutter/material.dart';
import 'package:sif/components/button.dart';
import 'package:sif/components/label.dart';
import 'package:sif/components/textfield.dart';
import 'package:sif/pages/admin/admin_page.dart';
import 'package:sif/pages/register_page.dart';

import '../components/appbar.dart';

class LoginPage extends StatelessWidget {
  final userIdController  = TextEditingController();
  final PasswordController = TextEditingController();
  LoginPage({super.key});

  void onsignin(){


  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child:  Scaffold(
        backgroundColor: Color.fromRGBO(66, 66, 66, 1),
        appBar:const PreferredSize(
          preferredSize:Size.fromHeight(45) ,
          child: appbar(),
      ),

        body:
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [SizedBox(height: 20,),
                  Center(
                    child: Container(
                      child: Text("Login"
                      ,style:TextStyle(
                          color: Color.fromRGBO(239, 242, 42, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Mylabel(label_text: "User ID"),
                  SizedBox(height: 5,),
                  MyTextField(
                    controller: userIdController
                      ,hintText: 'Enter User ID',
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: 20,),
                  Mylabel(label_text: "Password"),
                  SizedBox(height: 5,),
                  MyTextField(
                      controller: PasswordController
                      ,hintText: 'Enter Your Password',
                      obscureText: true),
                  SizedBox(height: 50,),
                  MyButton(
                    onTap: (){
                      print(userIdController.text);
                      print(PasswordController.text);
                      if(userIdController.text=="755" && PasswordController.text=="123" ){
                        Navigator.pushAndRemoveUntil(context , MaterialPageRoute(builder: (context)=> AdminPage()), (route) => false);
                      }
                      else{}

                    }
                      ,text: "Login"),
                  GestureDetector(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  RegisterPage()),
                    );},
                    child: Text("Register"
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
          )




      ),
    );
  }
}
