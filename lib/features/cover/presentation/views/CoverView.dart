import 'package:flutter/material.dart';
import 'package:myapp/features/cover/presentation/views/widgets/CoverViewBody.dart';

class CoverView extends StatelessWidget {
  const CoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF154c49),
        body: CoverViewBody(),
      ),
    );
  }
}
