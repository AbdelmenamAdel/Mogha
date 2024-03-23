import 'package:flutter/material.dart';

class ReactionButton extends StatefulWidget {
  @override
  _ReactionButtonState createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _showReactions = false;
  String _selectedReaction = '';

  List<String> _reactions = [
    '👍', // Smile
    '❤️', // Smile
    '😍', // Heart eyes
    '😆', // Grinning squinting face
    '😢', // Crying face
    '😠', // Angry face
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.ease),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // mainAxisSize: MainAxisSize.min,
      alignment: Alignment.centerLeft,
      children: [
        GestureDetector(
          onLongPress: () {
            _showReactions ? _hideReactions() : _showReactionsMenu();
          },
          child: CircleAvatar(
            radius: 24, backgroundColor: Colors.blue.withOpacity(.4),
            // padding: EdgeInsets.all(8.0),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(24.0),
            //   color: Colors.grey[200],
            // ),
            child: _selectedReaction.isNotEmpty
                ? Text(
                    _selectedReaction,
                    style: TextStyle(fontSize: 24.0),
                  )
                : Icon(Icons.thumb_up, color: Colors.blue),
          ),
        ),
        _showReactions ? _buildReactions() : SizedBox(),
      ],
    );
  }

  Widget _buildReactions() {
    return FadeTransition(
      opacity: _scaleAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: EdgeInsets.only(top: 8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200],
          ),
          child: Wrap(
            spacing: 8.0,
            children: _reactions.map((reaction) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedReaction = reaction;
                    _hideReactions();
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color:
                        _selectedReaction == reaction ? Colors.blue[100] : null,
                  ),
                  child: Text(
                    reaction,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showReactionsMenu() {
    setState(() {
      _showReactions = true;
    });
    _animationController.forward();
  }

  void _hideReactions() {
    _animationController.reverse().then((value) {
      setState(() {
        _showReactions = false;
      });
    });
  }
}
