import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteField extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;
  final TextEditingController _controller;
  final bool _readOnly;

  NoteField(
    this._themes,
    this._themeIndex,
    this._controller,
    this._readOnly,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _themeIndex == 2
            ? Colors.white
            : _themes[_themeIndex].withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: TextField(
        controller: _controller,
        maxLines: null, // Expands to fill available space
        readOnly: _readOnly,
        style: GoogleFonts.openSans(
          fontSize: 18.0,
          color: _themeIndex == 2 ? Colors.black : Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Start writing your note...',
          hintStyle: GoogleFonts.raleway(
            fontSize: 18.0,
            color: _themeIndex == 2 ? Colors.grey : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
