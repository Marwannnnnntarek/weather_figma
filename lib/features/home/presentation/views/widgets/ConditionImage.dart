import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/assetsData.dart';

class ConditionImage extends StatelessWidget {
  const ConditionImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetsData.Cloud),
        ),
      ),
    );
  }
}