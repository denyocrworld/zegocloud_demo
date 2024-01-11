// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final Widget child;
  const InfoContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 2.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      child: child,
    );
  }
}
