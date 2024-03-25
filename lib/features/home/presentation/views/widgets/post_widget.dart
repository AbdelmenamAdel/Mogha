import 'package:flutter/material.dart';

import 'reaction_button.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
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
                    ReactionButton(),
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
