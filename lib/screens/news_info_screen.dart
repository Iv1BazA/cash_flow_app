import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/category.dart';
import 'package:cash_flow_app/const/model.dart';
import 'package:cash_flow_app/const/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class InfoNewsWidget extends StatefulWidget {
  News news;
  InfoNewsWidget({super.key, required this.news});

  @override
  State<InfoNewsWidget> createState() => _InfoNewsWidgetState();
}

class _InfoNewsWidgetState extends State<InfoNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('News info',
              style: discription.copyWith(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: primary,
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(widget.news.image, width: double.infinity, height: 260),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: grey),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    Text(
                      '${widget.news.title}',
                      style: discription.copyWith(
                          color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          Text('${widget.news.discription}',
                              style: discription),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
