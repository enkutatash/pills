import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/widget/custom_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.24,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/pill.jpg",
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Welcome ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Stay on track with your medications, manage your schedules effortlessly, and take charge of your health.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // const Spacer(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              CustomButton(
                text: "Next",
                onPressed: () => context.go(
                  "/home_page",
                ),
                color: Colors.blue,
                textColor: Colors.white,
                width: 0.9,
                height: 0.07,
                radius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
