import 'package:bank_sp/features/profile/presentation/widgets/profile_item_list_widget.dart';
import 'package:bank_sp/gen/colors.gen.dart';
import 'package:bank_sp/infrastructure/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go(AppRouter.homePath);
          },
        ),
      ),
      body: Center(
        child: buildBodyWidget,
      ),
    );
  }

  Widget get buildBodyWidget {
    return Column(
      children: [
        headerWidget,
        const SizedBox(height: 32),
        const ProfileItemListWidget(),
      ],
    );
  }

  Widget get headerWidget {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: ColorName.secondaryLight,
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Icon(
            Icons.person,
            color: ColorName.primaryDark,
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(
          height: 24,
          child: Center(
            child: Text(
              'MINH',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ColorName.secondaryDark,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified_outlined,
              size: 24,
              color: ColorName.green,
            ),
             SizedBox(width: 8),
             Text(
              'Verified account',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorName.secondaryDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
