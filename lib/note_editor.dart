import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';
import 'note_field.dart';
import 'emoji_picker.dart';

class NoteEditor extends StatefulWidget {
  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  final List<Color> _themes = [
    Colors.blue,
    Colors.yellow,
    Colors.black,
    Colors.green,
    Colors.purple,
    Colors.orange,
  ];
  int _themeIndex = 0;
  final TextEditingController _controller = TextEditingController();
  String _note = '';
  bool _readOnly = false;
  bool _showEmojiPicker = false;

  void _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeIndex', _themeIndex);
    prefs.setString('note', _controller.text);
    prefs.setBool('readOnly', _readOnly);
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _themeIndex = prefs.getInt('themeIndex') ?? 0;
      _note = prefs.getString('note') ?? '';
      _readOnly = prefs.getBool('readOnly') ?? false;
      _controller.text = _note;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showEmojiPicker = false;
          });
        },
        child: Column(
          children: [
            ThemeHeader(
              _themes,
              _themeIndex,
              (index) {
                setState(() {
                  _themeIndex = index;
                  _savePreferences();
                });
              },
              _readOnly,
              () {
                setState(() {
                  _readOnly = !_readOnly;
                  _savePreferences();
                });
              },
              () {
                setState(() {
                  _showEmojiPicker = !_showEmojiPicker;
                });
              },
              _showEmojiPicker,  // Pass the _showEmojiPicker state
            ),
            Expanded(
              child: NoteField(
                _themes,
                _themeIndex,
                _controller,
                _readOnly,
              ),
            ),
            if (_showEmojiPicker)
              EmojiPickerWidget(
                onEmojiSelected: (emoji) {
                  _controller.text += emoji.emoji;
                },
              ),
            ThemeFooter(_themes, _themeIndex),
          ],
        ),
      ),
    );
  }
}
