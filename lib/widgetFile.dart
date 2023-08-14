import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rajneeshloginvalidation/utils.dart';

class WidgetFile {
  static textStyle(double size, clr, FontWeight weight) {
    return GoogleFonts.inter(
      fontSize: size,
      color: clr,
      fontWeight: weight,
    );
  }

  Widget formTextField(
      String hint, TextEditingController controller, bool _is_enabled,String leadAssets,context,foc) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.04)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          enabled: _is_enabled,
          focusNode: foc,
          keyboardType: TextInputType.emailAddress,
          // autofocus: true,
          style: WidgetFile.textStyle(14, Colors.black, FontWeight.w400),
          decoration: InputDecoration(
            counterText: "",
            fillColor: Colors.white,
            prefixIcon: leadAssets.isNotEmpty?Image.asset(leadAssets,scale: 3):null,
            hintStyle: WidgetFile.textStyle(
            14,
            Colors.black26,
            FontWeight.w400,
          ),
            hintText: hint,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.black54)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.black54)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.black54)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.black54)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.black54)),
          ),
        ),
      ),
    );
  }
}