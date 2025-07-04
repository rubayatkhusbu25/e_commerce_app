import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (String? value){

      },
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,

        )



      ),

    );
  }
}