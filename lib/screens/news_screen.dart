import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/news.dart';
import 'package:cash_flow_app/screens/news_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

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
                'News',
                style: discription.copyWith(color: Colors.white),
              ),
            )),
      ),
      SizedBox(height: 10),
      Container(
        height: MediaQuery.of(context).size.height / 1.26,
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InfoNewsWidget(news: listNews[index]),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: grey),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Center(
                          child: Image.asset(
                            listNews[index].icon,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            '${listNews[index].title}',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: discription.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: listNews.length),
      )
    ]);
  }
}
