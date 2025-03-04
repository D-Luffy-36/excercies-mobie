
import 'package:flutter/material.dart';
import 'on_boarding_page.dart';

// StatefulWidget giúp thay đổi giao diện khi người dùng chuyển trang.

// PageView - Tạo hiệu ứng vuốt giữa các trang



class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                OnboardingPage(
                  image: 'assets/WellComeScreen/wc1.svg',
                  title: 'Welcome To Click & Buy',
                ),
                OnboardingPage(
                  image: 'assets/WellComeScreen/wc2.png',
                  title: 'Choose products',
                  description: 'Thousands of high-quality products in various styles.',
                ),
                OnboardingPage(
                  image: 'assets/WellComeScreen/wc3.png',
                  title: 'Payment made easy',
                  description: 'Supports multiple convenient payment methods.',
                ),
                OnboardingPage(
                  image: 'assets/WellComeScreen/wc4.png',
                  title: 'Receive at your home',
                  description: 'Your order will be delivered to your doorstep.',
                ),
              ],
            ),
          ),

          // Chỉ số trang (Dots)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) => buildDot(index)),
          ),

          // Nút Skip & Next
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.jumpToPage(3);
                  },
                  child: Text("Skip", style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex < 3) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Điều hướng đến trang Home sau khi hoàn thành Onboarding
                      Navigator.pushReplacementNamed(context, "/home");
                    }
                  },
                  child: Text(_currentIndex == 3 ? "Get Started" : "Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: _currentIndex == index ? 12 : 8,
      height: _currentIndex == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
