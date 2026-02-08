import 'dart:ui';

import 'package:flutter/material.dart';

class SimpleCategoryCard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? onTap;

  const SimpleCategoryCard({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    image,
                    height: 165,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  // 👇 fade between image and text
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black87, // same as container bg
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                width: double.infinity,
                color: Colors.black87,
                padding: const EdgeInsets.all(10),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
