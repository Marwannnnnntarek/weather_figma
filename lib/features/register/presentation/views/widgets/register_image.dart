import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/assets_data.dart';

class RegisterImage extends StatelessWidget {
  const RegisterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 53, bottom: 63),
      child: Container(
        height: 163,
        width: 182,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.logo),
          ),
        ),
      ),
    );
  }
}
