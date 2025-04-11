import 'package:flutter/material.dart';

AppBar commonAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
          )),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: actions,
    );
