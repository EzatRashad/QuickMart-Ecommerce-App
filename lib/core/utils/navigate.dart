import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void nextScreen(Widget screen,
      {bool replacment = false, bool remove = false}) {
    if (remove) {
      // Remove all screens and push the new one
      Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(builder: (context) => screen),
        (route) => false,
      );
    } else if (replacment) {
      // Replace the current screen with the new one
      Navigator.pushReplacement(
          this, MaterialPageRoute(builder: (context) => screen));
    } else {
      // Just push the new screen onto the stack
      Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
    }
  }
}

/*
-- To a new screen without any specific requirements:
    context.nextScreen(MyNewScreen());

-- Replace the current screen with a new one (this removes the current screen from the stack):
    context.nextScreen(MyNewScreen(), replacment: true);

-- Remove All Screens and Push a New One:
    context.nextScreen(MyNewScreen(), remove: true);

-- Replace the Current Screen and Remove All Previous Screens:
    context.nextScreen(MyNewScreen(), replacment: true, remove: true);

*/
