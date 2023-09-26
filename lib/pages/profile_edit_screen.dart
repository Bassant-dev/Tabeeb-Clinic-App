import 'package:flutter/material.dart';

class ProfileEditBody extends StatefulWidget {
  ProfileEditBody({Key? key}) : super(key: key);

  @override
  _RegisterScreenBodyState createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<ProfileEditBody> {
  bool isvisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String selectedGender = '1';
  bool Gender = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF174068),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Update details!',
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Update your info and become a new you!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0XFF030E19),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        else if(nameController.text.length<3){
                          return 'name must be more than 3 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        else if(!value.contains('@')){
                          return 'Please enter your valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        }
                        else if(value.length<11){
                          return 'Please enter your valid phone number';
                        }

                      },
                      decoration: InputDecoration(
                        labelText: 'Phone',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Radio buttons for gender selection
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*Row(
                          children: [
                            Checkbox(
                                value:false , //Male
                                onChanged: (value)
                                {
                                  setState(() {
                                   Gender=false;
                                  });
                                }
                            ),
                            Text('Male'),
                            Checkbox(
                                value:true , //Male
                                onChanged: (value)
                                {
                                  setState(() {
                                    Gender=true;
                                  });
                                }
                            ),
                            Text('Female'),
                          ],
                        ),*/
                        Row(
                          children: [
                            Radio(

                              value: '0', // Male
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Male',
                              style: TextStyle(
                                color: Color(0XFF030E19),
                                fontSize: 16
                              ),
                            ),
                            Radio(
                              value: '1', // Female
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Female',
                              style: TextStyle(
                                  color: Color(0XFF030E19),
                                  fontSize: 16
                              ),
                            ),
                          ],
                      ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(height: 5,),
                        TextButton( onPressed: (){},
                          child:Text('Change Password?',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0XFF030E19)
                              )
                          ),
                        )


                      ],
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        /*
                        if (formKey.currentState!.validate()) {
                          isvisible = true;
                          RegisterCubit.get(context).addRegister(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            gender: selectedGender, // Pass the selected gender
                            password: passwordController.text,
                            ConfirmPassword: confirmPasswordController.text,
                          );
                        }
                        */
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFF174068),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: const Size(312, 48),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }

  }

