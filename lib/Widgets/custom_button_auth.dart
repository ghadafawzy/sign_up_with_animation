import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  const CustomButtonAuth({Key? key, required this.text, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed:onpressed ,color: Color(0xFFE48A8A),
        textColor: Colors.white,
        child: Text(text),),
    );
  }
}
