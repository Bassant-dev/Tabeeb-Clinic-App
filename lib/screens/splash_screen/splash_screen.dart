
import 'dart:async';
import 'package:flutter/material.dart';

import '../onboarding_screen/onboarding_screen.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    MyHome()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 20),
        borderRadius: BorderRadius.circular(20),
        ),
        child:Column(
          children: [
            Spacer(flex: 3,),
            Image.asset(
                'assets/img/slider5.jpg',
            ),
            Text(
              'Tabeeb',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xFF174068).withOpacity(0.8),
              ),
            ),
            Spacer(flex: 3,),
          ],
        )
    );
  }
}
