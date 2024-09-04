import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class EmojiPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        // Handle emoji selection
      },
      config: Config(
        emojiTextStyle: null, // Keep original emoji colors
        emojiViewConfig: EmojiViewConfig(
          emojiSizeMax: 30, // Set the maximum emoji size
        ),
        categoryViewConfig: CategoryViewConfig(
          categoryIcons: CategoryIcons(),
        ),
      ),
    );
  }
}
