import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chapter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bhagavad Gita',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 18,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Chapter ${index + 1}', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChapterScreen(chapterNumber: index + 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
