import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/view/Screens/profile/widgets/account_grod_item.dart';
import 'package:bb_app/view/Screens/profile/widgets/double_color_title.dart';
import 'package:bb_app/view/Screens/profile/widgets/name_number_card.dart';
import 'package:bb_app/view_model_providers/user_manager_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model_providers/main_page_navbar_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userPageContoller = Provider.of<UserManagerViewModel>(context);
    final mainPageController = Provider.of<MainPageViewModel>(context);
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: const ColoredBox(
              color: KColors.kThemePurple,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DoubleColorTitle(
                    text1: 'My',
                    text2: 'Account',
                    firstColor: KColors.kWhiteColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const NameNumberCard(nameText: "Ishaque", phone: "9747344535"),
                const SizedBox(
                  height: 10,
                ),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  children: [
                    AccountGridItem(
                      icon: Icons.manage_accounts,
                      title: 'Edit Profile',
                      onTap: () {},
                    ),
                    AccountGridItem(
                      icon: Icons.info,
                      title: 'About',
                      onTap: () {},
                    ),
                    AccountGridItem(
                      icon: Icons.headset_mic,
                      title: 'Contact us',
                      onTap: () {},
                    ),
                    AccountGridItem(
                      icon: Icons.share_outlined,
                      title: 'Share',
                      onTap: () {},
                    ),
                    AccountGridItem(
                      icon: Icons.security,
                      title: 'Privacy ',
                      onTap: () {},
                    ),
                    AccountGridItem(
                        icon: Icons.logout,
                        title: 'Logout',
                        onTap: () {
                          userPageContoller.onLogoutButtonPress();
                          mainPageController.setIndex = 0;
                        }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
