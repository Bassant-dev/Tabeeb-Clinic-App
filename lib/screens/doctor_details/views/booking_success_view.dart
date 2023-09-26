import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/appfont.dart';


class BookingSuccessView extends StatelessWidget {
  const BookingSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Icon(
            Icons.done,
            color: Colors.green,
            size: 96.w,
          ),
          SizedBox(
            height: 16.h,
          ),
          const Text(
            'Appointment Booked',
            style: Styles.textStyle20,
          )
        ]),
      ),
    );
  }
}
