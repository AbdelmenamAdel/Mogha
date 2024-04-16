import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/features/post/views/widgets/default_app_bar.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).model;
        return Scaffold(
          body: Column(
            children: [
              DefaultAppBar(title: 'Edit Profile'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: 160,
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  userModel!.coverPhoto,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: Icon(
                                    IconBroken.Camera,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  radius: 65,
                                  child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage: NetworkImage(
                                        '${userModel.profilePhoto}',
                                      )),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomTextField(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(5),
    );
  }
}
