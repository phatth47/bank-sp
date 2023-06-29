import 'package:bank_sp/gen/assets.gen.dart';
import 'package:bank_sp/gen/colors.gen.dart';
import 'package:bank_sp/infrastructure/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorName.primaryDark,
              ColorName.primaryLight,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                bodyWidget,
                Positioned(
                  top: 14,
                  right: 20,
                  child: buildAvatarWidget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get bodyWidget {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.images.common.icLandline.svg(),
            const SizedBox(width: 16),
            Assets.images.common.icNotification.svg(),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 90,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: ColorName.whiteText,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: ColorName.blackText.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Üsuper",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorName.secondaryDark,
                ),
              ),
              Text(
                "8.100.000đ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorName.secondaryDark,
                ),
              ),
              Text(
                "Account No. 0000 0000 0134",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorName.greyText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get buildAvatarWidget {
    return GestureDetector(
      onTap: () {
        context.go(AppRouter.profilePath);
      },
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: ColorName.whiteText,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: ColorName.primaryDark,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: ColorName.secondaryLight,
            child: const Icon(
              Icons.person,
              color: ColorName.primaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
