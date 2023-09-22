import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/cache_helper.dart';
import '../../../core/component.dart';
import '../view_model/cubit/cubit.dart';
import '../view_model/cubit/states.dart';


class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({Key? key}) : super(key: key);

  bool isvisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();


  var formKey = GlobalKey<FormState>();
  Future<void> storeTokenInSharedPreferences(String token) async {
    CacheHelper.saveData(key: "token", value: token);
  }

  @override
  Widget build(BuildContext context) {

    print(CacheHelper.getData(key: "token"));
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) async {

        if (state is RegisterSuccessState) {

        }
      },

      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text('Let’s get started!',
                        style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'create an account and start booking now.',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: HexColor('#7C808A'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      label: 'Name',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      label: 'Email',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        }
                        return null;
                      },
                      label: 'Phone',
                    ),

                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      label: 'Password',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your confirm password';
                        }
                        return null;
                      },
                      label: 'confirm Password',
                    ),
                    SizedBox(height: 20.h),

                    ElevatedButton(
                      onPressed: () {

                        if (formKey.currentState!.validate()) {
                          isvisible = true;

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#174068'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: const Size(312, 48),
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
