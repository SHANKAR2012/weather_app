import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;

final String value;
  final  String  label;
  const AdditionalInfoItem({super.key, required this.icon,required this.label,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(icon, size: 48),
        const SizedBox(height: 8,),
        Text(label, style: const TextStyle(fontSize: 20),),
        const SizedBox(height: 8,),
         Text(value, style: const TextStyle(fontSize: 20),),

      ],

    );
  }
}