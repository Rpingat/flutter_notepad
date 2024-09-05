import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeHeader extends StatelessWidget {
  final List<Color> _themes;
  final int _themeIndex;
  final Function(int) _onThemeChange;
  final bool _readOnly;
  final Function() _onReadOnlyToggle;
  final Function() _onEmojiPickerToggle;
  final bool _showEmojiPicker;  // New parameter

  ThemeHeader(
    this._themes,
    this._themeIndex,
    this._onThemeChange,
    this._readOnly,
    this._onReadOnlyToggle,
    this._onEmojiPickerToggle,
    this._showEmojiPicker,  // Initialize the new parameter
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
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: IconButton(
              key: ValueKey(_themes[_themeIndex]),
              icon: Icon(
                FontAwesomeIcons.palette,
                color: _themes[_themeIndex],  // Dynamically set icon color
              ),
              onPressed: () {
                _onThemeChange((_themeIndex + 1) % _themes.length);
              },
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: IconButton(
              key: ValueKey(_readOnly),
              icon: Icon(
                _readOnly ? Icons.lock : Icons.lock_open,
                color: Colors.white,
              ),
              onPressed: _onReadOnlyToggle,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions,
              color: _showEmojiPicker ? Colors.yellow : Colors.white,  // Dynamic color
            ),
            onPressed: _onEmojiPickerToggle,
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
            onPressed: () {
              // Save functionality
            },
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Delete functionality
            },
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
