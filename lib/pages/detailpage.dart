// ignore_for_file: prefer_interpolation_to_compose_strings, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_vegetables_app/constants.dart';

import '../models/products.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class ClipPathDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height + 30, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          backgroundColor: widget.product.color!.withOpacity(0.4),
          elevation: 0,
          leadingWidth: 80,
          leading: Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: widget.product.color,
              ),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: widget.product.color!,
                  )),
            ),
            SizedBox(
              width: 20,
            )
          ]),
      bottomNavigationBar: Container(
        height: 100,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 20, top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    widget.product.price.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: kPrimaryGradientColor),
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 350,),
                Positioned(
                  bottom: 30,right: 20, left: 20,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          offset: const Offset(5, 5),
                          blurRadius: 15,
                          spreadRadius: 15,
                          color: widget.product.color!.withOpacity(0.5))
                    ]),
                  ),
                ),
                ClipPath(
                  clipper: ClipPathDetail(),
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    color: widget.product.color!.withOpacity(0.4),
                    
                  ),
                ),
               Positioned(
                bottom: -20,
                left: 20,right: 20,
                 child: Center(
                   child: Image.asset(
                          'assets/' + widget.product.image!,
                          width: MediaQuery.of(context).size.width-40,
                          height: 400,
                        ),
                 ),
               ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name!,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                          initialRating: widget.product.rate!,
                          allowHalfRating: true,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            );
                          },
                          onRatingUpdate: (rating) {}),
                      Text(
                        ' (' + widget.product.rate!.toString() + ')',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            quantity--;
                          }
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: grey),
                          child: Center(
                            child: Text(
                              '-',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        quantity.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          quantity++;
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: green),
                          child: Center(
                            child: Text(
                              '+',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.product.description!,
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
