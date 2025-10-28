import 'package:flutter/material.dart';
import 'package:store_app/widgets/icon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String pageId = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          "New Trend",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 65),
        child: GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of columns on the screen
              mainAxisSpacing: 50, // Y axis
              crossAxisSpacing: 10, // X axis
              childAspectRatio: 1.6,  // width to height
              ),
          itemBuilder: (context, index) => IconCard(),
        ),
      ),
    );
  }
}
