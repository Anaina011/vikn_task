import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff0A9EF3),
            borderRadius: BorderRadius.circular(25)),
        height: 50,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Icon(Icons.arrow_forward, color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
