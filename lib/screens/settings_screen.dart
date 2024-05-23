import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_icons.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/news.dart';
import 'package:cash_flow_app/screens/news_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 90,
        color: primary,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Settings',
                style: discription.copyWith(color: Colors.white),
              ),
            )),
      ),
      SizedBox(height: 10),
      Container(
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16), color: grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: grey),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(term),
                      SizedBox(width: 10),
                      Text(
                        'Terms of use',
                        style: discription.copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: opacity,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: grey),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(privacy),
                      SizedBox(width: 10),
                      Text(
                        'Privacy Policy',
                        style: discription.copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: opacity,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: grey),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(support),
                      SizedBox(width: 10),
                      Text(
                        'Support page',
                        style: discription.copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: opacity,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: grey),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(vector),
                      SizedBox(width: 10),
                      Text(
                        'Share with friends',
                        style: discription.copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: opacity,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: grey),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(sub),
                      SizedBox(width: 10),
                      Text(
                        'Subscription info',
                        style: discription.copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: opacity,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
