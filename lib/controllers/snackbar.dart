import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


showSnackbarError(String title, String message) {
  Get.snackbar(
    'Error',
    'Please enter email and password to continue.',
    backgroundColor:Colors.white,
    snackPosition: SnackPosition.TOP,
    titleText: Text(
      title,
      style: GoogleFonts.gothicA1(
        textStyle: TextStyle(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.gothicA1(
        textStyle: TextStyle(
            color: Colors.black,
      ))));
    
  
}
