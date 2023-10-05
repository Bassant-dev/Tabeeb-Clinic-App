import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v_care_clinic/core/Colors.dart';

import 'package:v_care_clinic/screens/ProfileScreen/viewmodel/UserProfileCubit/UserProfileCubit.dart';
import 'package:v_care_clinic/screens/ProfileScreen/viewmodel/UserProfileCubit/UserProfileStates.dart';
import 'package:v_care_clinic/screens/edit_profile_screen/view/widgets/edit_profile_screen.dart';


class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  Widget buildProfileHeader(BuildContext context) {
    final userData = UserProfileCubit
        .get(context)
        .userprofileModel!
        .data![0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20.h),
        CircleAvatar(
            radius: 39,
            backgroundColor: HexColor('#174068'),
            child: Container(
                child: Icon(Icons.person, color: Colors.white, size: 40,))),
        SizedBox(height: 10.h),
        Text(
          userData.name ?? 'Username',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
        ),
        SizedBox(height: 10.h),
        buildEditAccountButton(context),
        SizedBox(height: 20.h),
        Divider(color: mainColor),
        SizedBox(height: 20.h),
        buildProfileDetailRow(Icons.email, userData.email ?? 'Email'),
        SizedBox(height: 20.h),
        buildProfileDetailRow(Icons.phone, userData.phone ?? 'Phone'),
        SizedBox(height: 20.h),
        buildProfileDetailRow(Icons.lock, '*********'),
        // Replace with user's actual password
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget buildEditAccountButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfile())
        );
      },
      icon: Icon(Icons.edit),
      label: Text(
        'Edit account details',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: mainColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
      ),
    );
  }

  Widget buildProfileDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: mainColor,
          size: 24,
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: mainColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return BlocConsumer<UserProfileCubit, UserProfileStates>(
      listener: (BuildContext context, state) {
        // TODO: implement listener
        if (state is UserProfileSuccessState  ) {
          print("get user data doneeeeeeee");

          print( state.userprofilemodel.message);
          Fluttertoast.showToast(
            msg: "Successfully show user data",
            backgroundColor: Colors.green,
          );

        }
        if (state is  UserAppointmentSuccessState ) {
          print("get Appointments doneeeeeeee");

          print( state.appointments.length);
          Fluttertoast.showToast(
            msg: "Successfully show Appointments ",
            backgroundColor: Colors.green,
          );
        }

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              'VCare',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProfileHeader(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

