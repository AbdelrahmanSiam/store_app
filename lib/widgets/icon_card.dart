import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: 180,
          height: 120,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
          child: Card(
            elevation: 8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Dress",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text("\$87"), // or Text(r"@85")
                      Spacer(),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          child: Image.asset(
            "assets/dress.jpeg",
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
