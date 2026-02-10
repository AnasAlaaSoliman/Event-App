import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:flutter/material.dart';

class textfield extends StatefulWidget {
  final String message;
  final bool isPassword;
  final IconData pstfixIcon;

  const textfield( this.isPassword,this.pstfixIcon,{this.message = '', super.key});

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  bool _isHidden = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      //////////textfield
      margin: EdgeInsets.symmetric( horizontal: 5),
      child: TextField(
        obscureText: widget.isPassword ? _isHidden : _isHidden,
        style: TextStyle(color: ColorPallete.main_text),
        decoration: InputDecoration(
          hintText: widget.message,
          prefixIcon: Icon(widget.pstfixIcon,color: ColorPallete.sec_text,),
          suffixIcon: widget.isPassword
              ? InkWell(
            onTap: () {
              setState(() => _isHidden = !_isHidden);
            },
            child: Icon(Icons.visibility),
          )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: Color(0xffFFFFFF),
        ),
      ),
    );

    /////////////Button
  }
}
