import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'custom_story_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),

         slivers: [

           SliverToBoxAdapter(child: CustomAppBar(),),
           SliverToBoxAdapter(child: StoryListView(),),
           SliverToBoxAdapter(child: PostWidget(),),

         ],
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      // color: Colors.transparent.withOpacity(.35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 28,
              weight: 24,
            ),
          ),
          Text(
            Strings.mogha.tr(context),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(letterSpacing: 4),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_rounded,
              size: 28,
              weight: 24,
            ),
          ),
        ],
      ),
    );
  }
}
class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .26;

    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: CustomStoryItem(imageUrl: ''),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: Text('John Doe'),
            subtitle: Text('2 hours ago'),
            trailing: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return ['Edit', 'Delete', 'Report'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'This is a sample post text with rich text formatting, @mentions, #hashtags, and location tagging.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              Image.network('https://via.placeholder.com/150'),
              Image.network('https://via.placeholder.com/150'),
              Image.network('https://via.placeholder.com/150'),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  children: [
                    Text(
                      '123',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(width: 12),
                    FacebookReactionButton(),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {},
                    ),
                    Text(
                      '45',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write a comment...',
                  hintStyle: TextStyle(fontSize: 16)),
            ),
            trailing: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class FacebookReactionButton extends StatefulWidget {
  @override
  _FacebookReactionButtonState createState() => _FacebookReactionButtonState();
}

class _FacebookReactionButtonState extends State<FacebookReactionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _showReactions = false;
  String _selectedReaction = '';

  List<String> _reactions = [
    '😀', // Smile
    '😍', // Heart eyes
    '😆', // Grinning squinting face
    '😲', // Astonished face
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
            radius: 24
            ,backgroundColor: Colors.blue.withOpacity(.4),
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
