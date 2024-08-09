import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(6, 0, 6, 16),
        child: Column(
          children: [
            Divider(),
            Text(
              "This app is created as part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any from of advice. HLS assumers no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from relian on the information contained on this site.",
              style: TextStyle(color: Colors.black54, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text("Copyright 2012 HLS")
          ],
        ),
      ),
    );
  }
}
