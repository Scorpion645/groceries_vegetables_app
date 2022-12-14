// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_vegetables_app/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        'Jennifer',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/profile.png'))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search grocery',
                            hintStyle: GoogleFonts.poppins(color: Colors.grey),
                            prefixIcon: Icon(Icons.search_rounded, color: Colors.grey,),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none)),
                  )),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey),
                    child: Icon(Icons.tune_rounded, color: Colors.green,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
