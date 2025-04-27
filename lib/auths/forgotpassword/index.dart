import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC3FFF3),
      appBar: AppBar(
        backgroundColor: Color(0xFFC3FFF3),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "FORGOT PASSWORD",

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Please Enter Your Register Mobile Number To Receive a Verification Code",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: '9250828765',
                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
