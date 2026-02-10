import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:events_app/modules/Entry_pages/forgot_password.dart';
import 'package:events_app/modules/Entry_pages/register_page.dart';
import 'package:events_app/modules/Navigation_Screens/navigationPage.dart';
import 'package:events_app/modules/customWidget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                "Login to your account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorPallete.main_blue,
                ),
              ),
              SizedBox(height: 24),
              textfield(false,Icons.mail, message: "Enter Your Email"),
              SizedBox(height: 16),
              textfield(true,Icons.lock, message: "Enter Your Password"),
              SizedBox(height: 11),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      "Forget Password? ",
                      style: TextStyle(
                        color: ColorPallete.main_blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 52),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Homepage();
                      },
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.main_blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: ColorPallete.dark_main_text,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account ?",
                    style: TextStyle(
                      color: ColorPallete.sec_text,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  InkWell(
                    child: Text(
                      " Signup",
                      style: TextStyle(
                        color: ColorPallete.main_blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 3)),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: ColorPallete.main_blue,
                    ),
                  ),
                  Expanded(child: Divider(thickness: 3)),
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
