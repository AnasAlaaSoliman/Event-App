import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:events_app/modules/Entry_pages/login_page.dart';
import 'package:events_app/modules/customWidget/textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: ColorPallete.background,
        title: Image.asset("assets/images/light/Group 1 (2).png"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorPallete.main_blue,
                ),
              ),
              SizedBox(height: 24),
              textfield(false,Icons.person, message: "Enter Your name"),
              SizedBox(height: 24),
              textfield(false,Icons.mail, message: "Enter Your Email"),
              SizedBox(height: 16),
              textfield(true, Icons.lock,message: "Enter Your Password"),
              SizedBox(height: 16),
              textfield(true, Icons.lock,message: "Confirm Your Password"),

              SizedBox(height: 52),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: ColorPallete.main_blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: ColorPallete.dark_main_text,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: ColorPallete.sec_text,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  InkWell(
                    child: Text(
                      " Login",
                      style: TextStyle(
                        color: ColorPallete.main_blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 3,)),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: ColorPallete.main_blue,
                    ),
                  ),
                  Expanded(child: Divider(thickness: 3, )),

                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFFFFFF),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/light/image 6.png",
                      height: 32,
                      width:32,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "Sign up with Google",
                      style: TextStyle(
                        color: ColorPallete.main_blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
