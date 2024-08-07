import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_divider.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

import 'log_out_dialog.dart';

class LogOutBottomBar extends StatelessWidget {
  const LogOutBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            elevation: 5,
            context: context,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => LogOutWidget(),
          );
        },
        icon: Icon(IconBroken.Edit),
      ),
    );
  }
}

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 350,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    context.navigate(AppRoutes.profile, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            sl<SocialCubit>().model!.profilePhoto,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          sl<SocialCubit>().model!.userName,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Spacer(),
                        Icon(
                          Icons.verified,
                          color: AppColors.blue,
                        )
                      ],
                    ),
                  ),
                ),
                CustomDivider(),
                InkWell(
                  onTap: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          title: Strings.confirmLogOut.tr(context),
                          onYesTap: () {
                            sl<AuthCubit>().logOut().whenComplete(() {
                              Future.delayed(Duration(milliseconds: 500))
                                  .then((value) {
                                context.navigateReplace(
                                    AppRoutes.login, context);
                              });
                            });
                          },
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Logout,
                          size: 28,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          Strings.logout.tr(context),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomDivider(),
                InkWell(
                  onTap: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          title: Strings.createANewAccount.tr(context),
                          onYesTap: () {
                            sl<AuthCubit>().logOut().whenComplete(() {
                              Future.delayed(Duration(milliseconds: 500))
                                  .then((value) {
                                context.navigateReplace(
                                    AppRoutes.signUp, context);
                              });
                            });
                          },
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Plus,
                          size: 28,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          Strings.createANewAccount.tr(context),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomDivider(),
                InkWell(
                  onTap: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          title: Strings.confirmDelete.tr(context),
                          onYesTap: () {
                            sl<AuthCubit>().deleteAccount().whenComplete(() {
                              Future.delayed(Duration(milliseconds: 500))
                                  .then((value) {
                                context.navigateReplace(
                                    AppRoutes.login, context);
                              });
                            });
                          },
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Delete,
                          size: 28,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          Strings.deleteThisAccount.tr(context),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: Text(Strings.cancel.tr(context)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
