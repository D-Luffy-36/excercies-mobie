import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String? description;

  const OnboardingPage({required this.image, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              image,
              height: 250,
              width: 250, // Đặt width bằng height để giữ hình tròn
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange

            ),
            textAlign: TextAlign.center,
          ),
          if (description != null) ...[
            SizedBox(height: 10),
            Text(
              description!,
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
