import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteEditor extends StatefulWidget {
  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  final List<Color> _themes = [
    Colors.blue,
    Colors.yellow,
    Colors.black,
  ];
  int _themeIndex = 0;
  final TextEditingController _controller = TextEditingController();
  String _note = '';
  bool _readOnly = false;

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
      body: Column(
        children: [
          _Header(_themes, _themeIndex, (index) {
            setState(() {
              _themeIndex = index;
              _savePreferences();
            });
          }, _readOnly, () {
            setState(() {
              _readOnly = !_readOnly;
              _savePreferences();
            });
          }),
          _NoteField(_themes, _themeIndex, _controller, _readOnly),
          _Footer(_themes, _themeIndex),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;
  final Function(int) _onThemeChanged;
  final bool _readOnly;
  final Function() _onReadOnlyToggle;

  _Header(this._themes, this._themeIndex, this._onThemeChanged, this._readOnly, this._onReadOnlyToggle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: _themes[_themeIndex],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Note Editor',
            style: GoogleFonts.montserrat(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: _themeIndex == 2 ? Colors.white : Colors.black,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: _onReadOnlyToggle,
                child: Icon(
                  _readOnly ? FontAwesomeIcons.lock : FontAwesomeIcons.unlock,
                  size: 20.0,
                  color: _themeIndex == 2 ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 16.0),
              GestureDetector(
                onTap: () {
                  _onThemeChanged((_themeIndex + 1) % 3);
                },
                child: Icon(
                  _themeIndex == 0
                      ? FontAwesomeIcons.sun
                      : _themeIndex == 1
                          ? FontAwesomeIcons.cloudSun
                          : FontAwesomeIcons.moon,
                  size: 20.0,
                  color: _themeIndex == 2 ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NoteField extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;
  final TextEditingController _controller;
  final bool _readOnly;

  _NoteField(this._themes, this._themeIndex, this._controller, this._readOnly);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _themeIndex == 2 ? Colors.white : _themes[_themeIndex].withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: TextField(
          controller: _controller,
          maxLines: null,
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
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;

  _Footer(this._themes, this._themeIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: _themes[_themeIndex],
      child: Text(
        'Copyright 2024',
        style: GoogleFonts.merriweather(
          fontSize: 12.0,
          color: _themeIndex == 2 ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
