



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_clinic/core/Colors.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: mainColor,
        title:   Text('VCare'),
       // actions:[Icon(Icons.menu)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

                children: [
              SizedBox(
                height: 20.h,
              ),

              Icon(Icons.person),
              SizedBox(
                height: 10.h,
              ),


              Text('user name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Edit acount details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                /*   color: Color(0xFF030E19B2
                   ).withOpacity(0.7),*/
                    color: Colors.grey,
                  ),


                ),
                    SizedBox(
                      width: 5.h,
                    ),
                Icon(Icons.edit,
                  color:Colors.grey,
                ),


              ]),
              SizedBox(
                height: 20.h,
              ),

              Divider(
               // color: Color(0xFF030E19B2),
              ),
              SizedBox(
                height: 20.h,
              ),



              Row(children: [
                Icon(Icons.email),
                SizedBox(width: 10.w,),
                Text('employee@email.com'),



              ]),
              SizedBox(
                height: 20.h,
              ),

              Row(children: [
                Icon(Icons.phone),
                SizedBox(width: 10.w,),

                Text('+3634849494949'),



              ]),
              SizedBox(
                height: 20.h,
              ),

              Row(children: [
                Icon(Icons.lock),
                SizedBox(width: 10.w,),

                Text('password'),
                SizedBox(width: 10.w,),

                Icon(Icons.remove_red_eye_outlined),


              ]),
              SizedBox(
                height: 20.h,
              ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('History',


                ),
              ),

              Container(
                color: Colors.black,
                height: 1,
                width:57
              ),
              SizedBox(
                height: 20.h,
              ),

            //  Divider(),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color:mainColor,
                                    width: 2.0,
                                  ),

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
children: [
  Text('booking data'),
  Spacer(),
  Text('Status'),

],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
]
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
