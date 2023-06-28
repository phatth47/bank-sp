import 'package:bank_sp/gen/assets.gen.dart';
import 'package:bank_sp/gen/colors.gen.dart';
import 'package:bank_sp/infrastructure/components/primary_button_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: paddingTop,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.images.branding.ubankLogo.svg(),
                  const Text('Change language'),
                ],
              ),
            ),
            Expanded(child: Container()),
            Assets.images.welcome.welcome.image(),
            const SizedBox(height: 50),
            const Text(
              'Welcome to Übank',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: ColorName.mainText,
              ),
            ),
            const SizedBox(height: 50),
            PrimaryButtonWidget(
              title: 'Login / Register',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Explore as a guess',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ColorName.mainText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
