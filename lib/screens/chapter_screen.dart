import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/verse.dart';
import '../services/api_service.dart';
import 'verse_screen.dart';

class ChapterScreen extends StatefulWidget {
  final int chapterNumber;

  const ChapterScreen({super.key, required this.chapterNumber});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late Future<List<Verse>> _verses;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _verses = _apiService.getChapter(widget.chapterNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chapter ${widget.chapterNumber}',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Verse>>(
        future: _verses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Improved error display
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to Load Verses',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      // Display the specific error message from the ApiService
                      snapshot.error.toString().replaceAll("Exception: ", ""),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData) {
            final verses = snapshot.data!;
            return ListView.builder(
              itemCount: verses.length,
              itemBuilder: (context, index) {
                final verse = verses[index];
                return ListTile(
                  title: Text(
                    'Verse ${verse.verse}',
                    style: GoogleFonts.poppins(),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerseScreen(verse: verse),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No verses found.'));
          }
        },
      ),
    );
  }
}
