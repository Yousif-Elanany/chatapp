import 'package:chatapp/pages/RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constant.dart';
import '../helpers/CustomButton.dart';
import '../helpers/customtextFormField.dart';
import '../helpers/show_snak_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 75,
              ),
              Image.asset(
                "assets/scholar.png",
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Scholar Chat',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ]),
              Row(
                children: [
                  Text(
                    'LOGIN',
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
                onChanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                obscureText: true,
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButon(
                text: "Login",
                onPRESS: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await FireBaseLogin();
                      isloading = true;
                      setState(() {});
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        showSnackBar(context, 'user not found');
                      } else if (ex.code == 'wrong-password') {
                        showSnackBar(context, 'wrong password');
                      }
                    } catch (ex) {
                      print(ex);
                      showSnackBar(context, 'there was an error');
                    }
                  }
                  isloading = false;
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'dont\'t have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: const Text(
                      '  Register',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> FireBaseLogin() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
