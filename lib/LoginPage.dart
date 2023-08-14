import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rajneeshloginvalidation/RegistrationPage.dart';
import 'package:rajneeshloginvalidation/homescreen.dart';
import 'package:rajneeshloginvalidation/utils.dart';
import 'package:rajneeshloginvalidation/widgetFile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight(context) * 0.05),
              child: Text(
                "User Login Page",
                style: WidgetFile.textStyle(40, Colors.green, FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(screenWidth(context) * 0.04)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  style:
                      WidgetFile.textStyle(14, Colors.black54, FontWeight.w400),
                  decoration: InputDecoration(
                    counterText: "",
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Colors.green,
                    ),
                    hintStyle: WidgetFile.textStyle(
                      14,
                      Colors.black12,
                      FontWeight.w400,
                    ),
                    hintText: "Email ID",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(screenWidth(context) * 0.04)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  enabled: true,
                  keyboardType: TextInputType.name,
                  obscureText: _obscureText,
                  style:
                      WidgetFile.textStyle(14, Colors.black54, FontWeight.w400),
                  decoration: InputDecoration(
                    counterText: "",
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.green.shade400,
                    ),
                    hintStyle: WidgetFile.textStyle(
                      14,
                      Colors.black12,
                      FontWeight.w400,
                    ),
                    hintText: "Password",
                    suffixIcon: IconButton(
                        icon: Icon(
                            !_obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.green.shade500),
                        onPressed: _toggle),

                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                    disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54)),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(isValidate()){
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                      .then((user) {
                    print("User signed in: ${user.user!.uid}");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }).catchError((error) {
                    // An error occurred
                    displayToast("Error signing in: ${error.message}");
                  });
                }
              },
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green.shade500,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Center(
                      child: Text(
                    "Login",
                    style:
                        WidgetFile.textStyle(16, Colors.white, FontWeight.w500),
                  )),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't have login id, ",
                    style: TextStyle(color:Colors.black),),
                  InkWell(
                    onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                    },
                    child: const Text('Register Here !',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isValidate() {
    if(emailController.text.isEmpty){
      displayToast("Please enter your email id");
      return false;
    }if(passwordController.text.isEmpty){
      displayToast("Please enter your password ");
      return false;
    }
    return true;
  }
}
