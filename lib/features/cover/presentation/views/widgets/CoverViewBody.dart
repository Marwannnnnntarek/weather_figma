import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/helpers/assetsData.dart';

class CoverViewBody extends StatefulWidget {
  const CoverViewBody({super.key});

  @override
  State<CoverViewBody> createState() => _CoverViewBodyState();
}

class _CoverViewBodyState extends State<CoverViewBody> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      context.go('/StartView');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsData.cover,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
