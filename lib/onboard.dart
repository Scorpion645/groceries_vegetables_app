import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'pages/mainpage.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class ClipPathOnBoard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: ClipPathOnBoard(),
            child: Container(
              color: backgroundOnboard,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/woman_vegetable.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Buy Groceries Easily With Us!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 38, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Listen podcast and open your \nworld with this application',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: kPrimaryGradientColor,
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
