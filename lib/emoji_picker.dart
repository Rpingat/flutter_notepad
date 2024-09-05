import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class EmojiPickerWidget extends StatelessWidget {
  final Function(Emoji) onEmojiSelected;

  EmojiPickerWidget({required this.onEmojiSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      height: 250,  // Set the height of the emoji picker
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          onEmojiSelected(emoji);
        },
        config: Config(
          emojiViewConfig: const EmojiViewConfig(
            columns: 7,  // Number of columns in the emoji grid
            emojiSizeMax: 32.0,  // Maximum size for each emoji
            verticalSpacing: 0,  // Spacing between rows of emojis
            horizontalSpacing: 0,  // Spacing between columns of emojis
            noRecents: Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
            ),  // Custom widget to display when no recent emojis
          ),
          categoryViewConfig: const CategoryViewConfig(
            initCategory: Category.SMILEYS,  // Default category
            backgroundColor: Colors.white,  // Background color of emoji picker
            indicatorColor: Colors.blue,  // Color of the selected category indicator
            iconColor: Colors.grey,  // Default icon color for categories
            iconColorSelected: Colors.blue,  // Selected category icon color
            categoryIcons: CategoryIcons(),  // Default category icons
          ),
        ),
      ),
    );
  }
}
