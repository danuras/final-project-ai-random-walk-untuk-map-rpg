import 'package:flutter/material.dart';
import 'package:final_project_ai/main.dart';

void popup(String text, BuildContext context) {
  showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        Future.delayed(
          const Duration(seconds: 3),
          () => Navigator.pop(context),
        );
        return Align(
          alignment: const Alignment(0, 0.8),
          child: Container(
            height: maxHeight * 0.1,
            width: text.length * 0.03 * maxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(maxHeight * 0.05),
              ),
              color: const Color(0xcc880000),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: maxHeight * 0.03,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        );
      });
}
