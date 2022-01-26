import 'package:flutter/material.dart';
import 'package:party_ui/animation/fade_animation.dart';
import 'package:party_ui/animation/opacity_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color = Colors.yellow.shade800;
  bool isStart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          OpacityAnimation(delay: 2, child: backgroundGradient(context)),
          bodyContent(context)
        ],
      ),
    );
  }

  Widget bodyContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),

          // #main content
          const FadeAnimation(
            delay: 5,
            child: Text(
              "Find the best parties near you.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // #second content
          const FadeAnimation(
            delay: 5.2,
            child: Text(
              "Let us find you a party for your interest",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Expanded(flex: 4, child: Container()),

          // #button
          FadeAnimation(
            delay: 5.4,
            child: isStart
                ? AnimatedContainer(
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.8, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          color = Colors.red;
                          isStart = false;
                        });
                      },
                      child: const Text(
                        "Start",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.red,
                          minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.42, 50),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Google",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.blue,
                          minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.42, 50),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Facebook",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget backgroundGradient(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black87,
            Colors.black54,
            Colors.black54,
            Colors.black26,
          ],
        ),
      ),
    );
  }

  Widget backgroundImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/img.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
