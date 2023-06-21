import 'package:flutter/material.dart';

import '../constants.dart';

class SubtitleContainer extends StatelessWidget {
  const SubtitleContainer({
    required this.child,
    super.key,
  });
  final child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: kSecondaryColor1,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
