import 'package:chatapp/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helpers/CustomButton.dart';
import '../helpers/CustomTextFormField.dart';

class RegisterPage extends StatefulWidget {

   static String id= "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password;
  bool isLoading = false;
    GlobalKey<FormState> formKey = GlobalKey();



  @override
  
  Widget build(BuildContext context) {
    
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric (horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
             children: [
             const  SizedBox(
                        height: 75,
                      ),
              Image.asset("assets/scholar.png",
              height: 100,),
              const SizedBox(
                height: 10,
              ),
               Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                         const Text(
                            'Scholar Chat',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white
                            ),
                          ),
                        ]
                      ),
                        Row(
                        children: [
                          
                           Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
              CustomTextField(
                hintText: "Enter you email",
                onChanged: (data){
                  email=data;
                },
                
              ),
             const SizedBox(
                height: 10
                ),
                        CustomTextField(
                        obscureText: true,
                        onChanged: (data) {
                        password = data;
                        },
                        hintText: 'Password',
                        ),
                   const     SizedBox(
                        height: 20,
                        ),
                        CustomButon(text: "Register",
                        onTap: ()async{

                         await firebaseCreate();
              
              
                        },),
              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                      const       Text(
                            'already Have Account?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                            GestureDetector(
                            onTap: () {
              
                              Navigator.pop(context);
                            },
                            child:const Text(
                              '  Login',
                              style: TextStyle(
                                color: Color(0xffC7EDE6),
                              ),
                            ),
                          ),                    
              
                        ],),
             ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> firebaseCreate() async {
    UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
  }
}