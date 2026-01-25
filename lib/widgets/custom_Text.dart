import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onBackground
    ));
  }
}
