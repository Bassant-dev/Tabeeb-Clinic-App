import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,

  required String?Function(String?)? validate,
  void Function(String)? onsubmit,
  required String label,
  IconData? prifex,
  int ? maxline,
  void Function()? ontap,
  void Function(String)? onChange,
  bool isclickable=true,
  IconData? suffix,
  bool isPassword=false,
  void Function()? suffixpressed,


}) =>TextFormField(

// onTap:ontap ,
  enabled: isclickable,
  onChanged : onChange,
  obscureText:isPassword,
  controller: controller,
  validator: validate,
  keyboardType: TextInputType.text,
  onFieldSubmitted: onsubmit,
  cursorColor: Colors.black,
  maxLines: maxline,

  decoration: InputDecoration(
    fillColor: Colors.black,
    hoverColor: Colors.black,
    labelStyle: GoogleFonts.roboto(color: Colors.black),

    hintStyle:GoogleFonts.roboto(color: Colors.black,),

    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black) ),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(


      borderSide: BorderSide(
        color: Colors.black,
      ),

    ),
//
    labelText:(label),
    prefixIcon:Icon(prifex,color: Colors.black),
    suffixIcon: suffix !=null ? IconButton(
        color: Colors.black,
        onPressed:suffixpressed
        ,icon: Icon(suffix)) :null,
  ),
);
