import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeHeader extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;
  final Function(int) _onThemeChange;
  final bool _readOnly;
  final Function() _onReadOnlyToggle;
  final Function() _onEmojiPickerToggle;

  ThemeHeader(
    this._themes,
    this._themeIndex,
    this._onThemeChange,
    this._readOnly,
    this._onReadOnlyToggle,
    this._onEmojiPickerToggle,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: _themes[_themeIndex],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(FontAwesomeIcons.palette),
            onPressed: () {
              _onThemeChange((_themeIndex + 1) % _themes.length);
            },
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(_readOnly ? Icons.edit : Icons.lock),
            onPressed: _onReadOnlyToggle,
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.emoji_emotions),
            onPressed: _onEmojiPickerToggle,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ThemeFooter extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;

  ThemeFooter(this._themes, this._themeIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: _themes[_themeIndex],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
