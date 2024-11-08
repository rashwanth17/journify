import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';

class MyButtons extends StatelessWidget {
  final String label;
  final Function()? ontap;
  const MyButtons({super.key, required this.label, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 20),
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 10,
                ),
              )),
        ));
  }
}
