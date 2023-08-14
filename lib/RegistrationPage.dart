import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rajneeshloginvalidation/LoginPage.dart';
import 'package:rajneeshloginvalidation/utils.dart';
import 'package:rajneeshloginvalidation/widgetFile.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController fNController = TextEditingController();
  TextEditingController sNController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool _obscureText = true;

  var mobileController = TextEditingController();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(context) * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: WidgetFile().formTextField(
                          "First Name", fNController, true, "", context, null),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.45,
                    child:Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: WidgetFile().formTextField(
                          "Last Name", sNController, true, "", context, null),
                    ),
                  ),


                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
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
                      hintStyle: WidgetFile.textStyle(
                        14,
                        Colors.black26,
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
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(screenWidth(context) * 0.04)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mobileController,
                    enabled: true,
                    keyboardType: TextInputType.phone,
                    style:
                    WidgetFile.textStyle(14, Colors.black54, FontWeight.w400),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    ],
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Colors.white,
                      hintStyle: WidgetFile.textStyle(
                        14,
                        Colors.black26,
                        FontWeight.w400,
                      ),
                      hintText: "Mobile Number",
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
                margin: const EdgeInsets.only(bottom: 10),
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
                    style:
                    WidgetFile.textStyle(14, Colors.black54, FontWeight.w400),
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Colors.white,
                      hintStyle: WidgetFile.textStyle(
                        14,
                        Colors.black26,
                        FontWeight.w400,
                      ),
                      hintText: "Password",
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
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(screenWidth(context) * 0.04)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: confirmPasswordController,
                    enabled: true,
                    keyboardType: TextInputType.name,
                    style:
                    WidgetFile.textStyle(14, Colors.black54, FontWeight.w400),
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Colors.white,
                      hintStyle: WidgetFile.textStyle(
                        14,
                        Colors.black26,
                        FontWeight.w400,
                      ),
                      hintText: "Confirm Password",

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

                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text ,
                    ).then((user) {
                      print("User created: ${user.user!.uid}");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    }).catchError((error) {
                      print("Error creating user: ${error.message}");
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
                          "Register",
                          style:
                          WidgetFile.textStyle(16, Colors.white, FontWeight.w500),
                        )),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  bool isValidate() {
    String pattern = r'^[6-9]\d{9}$';
    RegExp regExp = RegExp(pattern);

    String emailPattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
    RegExp emailRegExp = RegExp(emailPattern);

    if (mobileController.text.length != 10 ||
        !regExp.hasMatch(mobileController.text)) {
      displayToast("Please enter your correct mobile number");
      return false;
    }
    if (emailController.text.isEmpty ||
        !emailRegExp.hasMatch(emailController.text)) {
      displayToast("Please enter your correct email-Id");
      return false;
    }
    if(fNController.text.isEmpty){
      displayToast("Please enter first name");
      return false;
    }
    if(passwordController.text.isEmpty || confirmPasswordController.text.isEmpty){
      displayToast("Please enter your password");
      return false;
    }
    if(passwordController.text != confirmPasswordController.text){
      displayToast("Password and confirm password should be same");
      return false;
    }

    return true;
  }
}
