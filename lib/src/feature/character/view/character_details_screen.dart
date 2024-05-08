// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloc_test/src/data/model/response_character.dart';
import 'package:bloc_test/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  static const routeName = 'CharacterDetailsScreen';
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(
      backgroundColor: AppColor.myGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.myGrey,
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //   args.name ?? '',
              //   style: TextStyle(
              //     color: AppColor.myGrey,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              background: Hero(
                tag: args.id!,
                child: Image.network(
                  args.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: AppColor.myGrey,
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      characterInfo(title: "Name: ", text: args.name ?? ''),
                      buildDivider(endIndent: 315),
                      characterInfo(title: "Status: ", text: args.status ?? ''),
                      buildDivider(endIndent: 290),
                      characterInfo(title: "Gender: ", text: args.gender ?? ''),
                      buildDivider(endIndent: 260),
                      characterInfo(
                          title: "Origin: ", text: args.origin?.name ?? ''),
                      buildDivider(endIndent: 240),
                      characterInfo(
                          title: "Location: ", text: args.location?.name ?? ''),
                      buildDivider(endIndent: 200),
                      characterInfo(
                        title: "Number of episode: ",
                        text: args.episode?.length.toString() ?? '',
                      ),
                      buildDivider(endIndent: 180),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget characterInfo({required String title, required String text}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: AppColor.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              color: AppColor.myYellow,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDivider({required double endIndent}) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: AppColor.myYellow,
      thickness: 2,
    );
  }
}
