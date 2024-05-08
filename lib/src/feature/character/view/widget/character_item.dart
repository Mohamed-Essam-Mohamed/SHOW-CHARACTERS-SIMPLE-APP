// ignore_for_file: use_super_parameters, sort_child_properties_last

import 'package:bloc_test/src/data/model/response_character.dart';
import 'package:bloc_test/src/feature/character/view/character_details_screen.dart';
import 'package:bloc_test/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Results character;

  CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColor.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            CharacterDetailsScreen.routeName,
            arguments: character,
          );
        },
        child: GridTile(
          child: Hero(
            tag: character.id!,
            child: Container(
              color: AppColor.myGrey,
              child: character.image != null
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fadeInDuration: const Duration(seconds: 1),
                      //  animation for image
                      fadeInCurve: Curves.bounceOut,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image ?? '',
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/image-not-found-icon.png',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: AppColor.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
