import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moga/features/home/presentation/views/widgets/custom_post_widget.dart';
import 'package:moga/features/post/data/model/post_model.dart';

class MyPostsWidget extends StatelessWidget {
  const MyPostsWidget({
    super.key,
    required this.uId,
  });

  final String uId;

  @override
  Widget build(BuildContext context) {
    var posts = FirebaseFirestore.instance.collection('posts');

    return StreamBuilder(
      stream: posts.orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }
        if (snapshot.hasData) {
          List<PostModel> posts = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            if (snapshot.data!.docs[i]['uId'] == uId)
              posts.add(PostModel.fromJson(snapshot.data!.docs[i]));
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) =>
                CustomPostWidget(postModel: posts[index], index: index),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
