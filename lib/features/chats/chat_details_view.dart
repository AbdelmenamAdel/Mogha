import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/custom_text_f_field.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blueGrey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(IconBroken.Arrow___Left_2)),
          titleSpacing: -10.0,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('${user.profilePhoto}'),
              ),
              SizedBox(width: 10),
              Text(
                '${user.userName}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).textTheme.displayLarge!.color),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Call,
                color: AppColors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Video,
                color: AppColors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: SingleChildScrollView()),
              CustomTextField(
                height: 50,
                hintText: 'Write a message....',
              )
            ],
          ),
        ));
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:moga/core/utils/app_colors.dart';
// import 'package:moga/core/utils/app_images.dart';

// import '../auth/presentation/manager/auth/auth_cubit.dart';

// class ChatWithView extends StatelessWidget {
//   const ChatWithView({super.key});

//   @override
//   Widget build(BuildContext context) {

//     TextEditingController messageController = TextEditingController();
//     final ScrollController controller = ScrollController();
//  final String email =
//         BlocProvider.of<AuthCubit>(context).emailController2.text;
//     final ScrollController controller = ScrollController();
//     CollectionReference messages =
//         FirebaseFirestore.instance.collection(AppStrings.messages);

//     return  StreamBuilder<QuerySnapshot>(
//         stream: messages.orderBy('CreatedAt', descending: true).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData) {
//             List<MessageModel> messageList = [];
//             for (int i = 0; i < snapshot.data!.docs.length; i++) {
//               messageList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
//             }
//             return Scaffold(
//               appBar: AppBar(
//                 toolbarHeight: 50,
//                 backgroundColor: AppColors.primary,
//                 title: Text(AppStrings.Chatify),
//                 centerTitle: true,
//               ),
//               body: Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                         AppAssets.backgroundh), // Replace with your image path
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ListView.builder(
//                           reverse: true,
//                           controller: controller,
//                           itemCount: messageList.length,
//                           itemBuilder: (context, index) => CustomChatBubble(
//                             type: messageList[index].id == email
//                                 ? BubbleType.sendBubble
//                                 : BubbleType.receiverBubble,
//                             model: messageList[index],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       color: AppColors.white,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: CustomTextFormField(
//                                 onSubmit: (data) {
//                                   messages.add({
//                                     AppStrings.message: data,
//                                     'CreatedAt': DateTime.now(),
//                                     'id': email
//                                   });
//                                   messageController.clear();
//                                   controller.animateTo(0,
//                                       duration: Duration(milliseconds: 500),
//                                       curve: Curves.easeIn);
//                                 },
//                                 controller: messageController,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return AppStrings.empty;
//                                   }
//                                   return null;
//                                 },
//                                 radius: 16,
//                                 hintText: 'Type message...',
//                                 suffix1: Icons.attach_file,
//                                 suffix2: Icons.camera_alt,
//                                 prefix: Icons.emoji_emotions_outlined,
//                                 suffixOnPressed1: () {},
//                                 suffixOnPressed2: () {},
//                                 prefixOnPressed: () {},
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 print(email);
//                                 print(
//                                     "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
//                                 messages.add({
//                                   AppStrings.message: messageController.text,
//                                   'CreatedAt': DateTime.now(),
//                                   'id': email
//                                 });
//                                 messageController.clear();
//                                 controller.animateTo(0,
//                                     duration: Duration(milliseconds: 500),
//                                     curve: Curves.easeIn);
//                                 print(AuthCubit().emailController2.text);
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 8),
//                                 padding: EdgeInsets.all(20),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.primary,
//                                     borderRadius: BorderRadius.circular(16)),
//                                 child: Icon(
//                                   Icons.send,
//                                   color: AppColors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Something went wrong'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//                 appBar: AppBar(
//                   toolbarHeight: 50,
//                   backgroundColor: AppColors.kPrimary,
//                   title: Text('Chatify'),
//                   centerTitle: true,
//                 ),
//                 body: Stack(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                             AppImages.on1
//                               ), // Replace with your image path
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: SizedBox()),
//                           ),
//                           Container(
//                             color: AppColors.white,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [

//                                   Spacer(),
//                                   // Expanded(
//                                   //   child: CustomTextFormField(
//                                   //     onSubmit: (data) {
//                                   //       // messages.add({
//                                   //       //   AppStrings.message: data,
//                                   //       //   'CreatedAt': DateTime.now(),
//                                   //       //   'id': email
//                                   //       // });
//                                   //       messageController.clear();
//                                   //       controller.animateTo(0,
//                                   //           duration:
//                                   //           Duration(milliseconds: 500),
//                                   //           curve: Curves.easeIn);
//                                   //     },
//                                   //     controller: messageController,
//                                   //     validator: (value) {
//                                   //       if (value!.isEmpty) {
//                                   //         return 'AppStrings.empty';
//                                   //       }
//                                   //       return null;
//                                   //     },
//                                   //     radius: 16,
//                                   //     hintText: 'Type message...',
//                                   //     suffix1: Icons.attach_file,
//                                   //     suffix2: Icons.camera_alt,
//                                   //     prefix: Icons.emoji_emotions_outlined,
//                                   //     suffixOnPressed1: () {},
//                                   //     suffixOnPressed2: () {},
//                                   //     prefixOnPressed: () {},
//                                   //   ),
//                                   // ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       print(email);
//                                       // messages.add({
//                                       //   AppStrings.message:
//                                       //   messageController.text,
//                                       //   'CreatedAt': DateTime.now(),
//                                       //   'id': email
//                                       // });
//                                       messageController.clear();
//                                       controller.animateTo(0,
//                                           duration: Duration(milliseconds: 500),
//                                           curve: Curves.easeIn);
//                                     },
//                                     child: Container(
//                                       margin: EdgeInsets.only(left: 8),
//                                       padding: EdgeInsets.all(20),
//                                       decoration: BoxDecoration(
//                                           color: AppColors.kPrimary,
//                                           borderRadius:
//                                           BorderRadius.circular(16)),
//                                       child: Icon(
//                                         Icons.send,
//                                         color: AppColors.white,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Center(
//                         child: CircularProgressIndicator()),
//                   ],
//                 ));
//           } else {
//             return Center(child: Text('Try again later'));
//           }
//         });
//   }
//   }
// }
