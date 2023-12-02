import 'package:flutter/material.dart';

class Equipment extends StatefulWidget {

  const Equipment({super.key});

  @override
  State<Equipment> createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 110,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/images/squat-exercise.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Checkbox(
                value: value,
                onChanged: (bool? value) {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Bands",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
