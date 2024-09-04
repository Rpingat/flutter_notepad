import 'package:flutter/material.dart';
import 'emoji_picker.dart';

class NoteField extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;
  final TextEditingController _controller;
  final bool _readOnly;
  final Function() _onEmojiPickerToggle;
  final bool _showEmojiPicker;

  NoteField(
    this._themes,
    this._themeIndex,
    this._controller,
    this._readOnly,
    this._onEmojiPickerToggle,
    this._showEmojiPicker,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: _themeIndex == 2 ? Colors.white : _themes[_themeIndex].withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            readOnly: _readOnly,
            maxLines: null,
            expands: true,
            style: TextStyle(
              fontSize: 18.0,
              color: _themeIndex == 2 ? Colors.black : Colors.white,
            ),
            onChanged: (text) {
              // Handle text change
            },
          ),
          _showEmojiPicker
              ? EmojiPickerWidget()
              : Container(),
        ],
      ),
    );
  }
}
