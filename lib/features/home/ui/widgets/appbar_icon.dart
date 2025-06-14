
import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({
    super.key, required this.onTap, required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey.shade300,
          child: Icon(iconData,color: Colors.grey,size: 22,),
        ),
      ),
    );
  }
}