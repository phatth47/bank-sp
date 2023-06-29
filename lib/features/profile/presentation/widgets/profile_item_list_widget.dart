import 'package:bank_sp/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfileItemListWidget extends StatelessWidget {
  const ProfileItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileListItem> profileItemList = [
      ProfileListItem(
        title: 'My Profile',
        icon: Assets.images.common.icAccount.svg(),
        onPressed: () {},
        isToggle: false,
      ),
      ProfileListItem(
        title: 'Beneficiaries',
        icon: Assets.images.common.icBenificiary.svg(),
        onPressed: () {},
        isToggle: false,
      ),
      ProfileListItem(
        title: 'Change password',
        icon: Assets.images.common.icLock.svg(),
        onPressed: () {},
        isToggle: false,
      ),
      ProfileListItem(
        title: 'Face ID',
        icon: Assets.images.common.icFaceId.svg(),
        onPressed: () {},
        isToggle: true,
      ),
      ProfileListItem(
        title: 'Terms & Conditions',
        icon: Assets.images.common.icTc.svg(),
        onPressed: () {},
        isToggle: false,
      ),
      ProfileListItem(
        title: 'Logout',
        icon: Assets.images.common.icLogout.svg(),
        onPressed: () {},
        isToggle: false,
      ),
    ];
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final ProfileListItem profileItem = profileItemList[index];
        return ProfileItemWidget(profileItem: profileItem);
      },
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Divider(height: 0),
        );
      },
      itemCount: profileItemList.length,
    );
  }
}

class ProfileItemWidget extends StatelessWidget {
  final ProfileListItem profileItem;

  const ProfileItemWidget({
    super.key,
    required this.profileItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Center(
        child: ListTile(
          leading: profileItem.icon,
          title: Text(profileItem.title),
          trailing: profileItem.isToggle
              ? Switch(
                  value: true,
                  onChanged: (value) {},
                )
              : null,
          onTap: profileItem.onPressed,
        ),
      ),
    );
  }
}

class ProfileListItem {
  final String title;
  final Widget icon;
  final VoidCallback onPressed;
  final bool isToggle;

  const ProfileListItem({
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.isToggle,
  });
}
