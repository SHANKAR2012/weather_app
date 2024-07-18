import 'package:flutter/material.dart';



class HourlyForecastItems extends StatelessWidget {
  final IconData icon;
  final String time;
  final String value;
  const HourlyForecastItems({super.key,
  required this.icon,
  required this.time,
  required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8,),
            Icon(icon,size:32),
            const SizedBox(height: 8,),
            Text(value,
              style: const TextStyle(
                  fontSize: 8
              ),)


          ],
        ),
      ),
    );
  }
}