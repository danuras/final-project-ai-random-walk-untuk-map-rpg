import 'package:flutter/material.dart';
import 'package:final_project_ai/main.dart';

class Button2 extends StatefulWidget {
  const Button2(this.textButton, this.action, {Key? key}) : super(key: key);

  final String textButton;
  final VoidCallback action;

  @override
  State<Button2> createState() => _Button2State();
}

class _Button2State extends State<Button2> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight * 0.1,
      width: maxHeight * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            clicked
                ? 'assets/images/ui/clicked_button2.png'
                : 'assets/images/ui/button2.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SizedBox(
        height: maxHeight * 0.1,
        width: maxHeight * 0.4,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTapDown: (tap) {
            clicked = true;
            setState(() {});
          },
          onTapUp: (tap) {
            clicked = false;
            setState(() {});
          },
          onTapCancel: () {
            clicked = false;
            setState(() {});
          },
          onTap: () {
            widget.action.call();
          },
          child: Center(
            child: Text(
              widget.textButton,
              style: TextStyle(
                color: Colors.white,
                fontSize: maxHeight * 0.04,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
