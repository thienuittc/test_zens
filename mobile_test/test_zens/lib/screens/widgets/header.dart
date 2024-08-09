import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo.png'),
                Row(
                  children: [
                    const Text(
                      "Handicrafted by \nJim HLS",
                      textAlign: TextAlign.right,
                    ),
                    Image.asset('assets/images/flower.png'),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xFF29b363),
          width: double.infinity,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(16, 35, 16, 35),
            child: Column(
              children: [
                Text(
                  "A joke a day keeps the doctor away",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "If you joke wrong way, your teech have to pay. (Serious)",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
