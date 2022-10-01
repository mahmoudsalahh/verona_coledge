import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget defaultButton({
  double width = 350.0,
  Color background = Colors.deepOrange,
  required VoidCallback onpressed,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: background,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget defaulttextformfeild(
        {required TextEditingController controller,
        required TextInputType type,
        required String label,
        required FormFieldValidator validate,
        required IconData prefix,
          //required IconData suffix,
        Color suffixColor = Colors.deepOrange}) =>
    TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey
          ),
          prefixIcon: Icon(prefix,color: Colors.deepOrange),
          floatingLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange
          ),
          //suffixIcon: Icon(suffix,color: Colors.deepOrange),
          //suffixIconColor: suffixColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.deepOrange,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
        validator: validate);

Widget defaultCard({
  String? text,
  String? image

}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius:.05,
          blurRadius: 1,
          //offset: Offset.infinite//// changes position of shadow
        ),
      ],
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Card(
      //shadowColor: Colors.black54,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CircleAvatar(
          radius: 33,
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: SvgPicture.asset('$image' ,width: 50)),
          Text(
            text!,
            style: GoogleFonts.poppins().copyWith(
                color: Colors.deepOrange,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
Widget svgPicture ({image, text}){
  return SvgPicture.asset(
    height: 50,
    '$image',
    //color: Colors.deepOrange,
  semanticsLabel: text,
    //theme: SvgTheme(fontSize: 23,currentColor: Colors.deepOrange,xHeight: 1.5),
  );
}

Widget defaultListTile ({
  String? text ,
  IconData? icon ,
}){
  return ListTile(
    onTap: (){},
    title: Text(text!, style: GoogleFonts.poppins().
    copyWith(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),),
    trailing:Row(
      children: [
        Icon(icon),
        Text(text, style: GoogleFonts.poppins().
        copyWith(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold
        ),),
      ],
    ) ,

  );
}

