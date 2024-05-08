// ignore_for_file: unused_element, prefer_const_constructors

import 'package:bloc_test/src/controller/network_check.dart';
import 'package:bloc_test/src/feature/character/view/widget/character_item.dart';
import 'package:bloc_test/src/feature/character/view_model/home_view_model_cubit.dart';
import 'package:bloc_test/src/feature/no_internet/no_internet_screen.dart';
import 'package:bloc_test/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CharacterScreen extends StatefulWidget {
  static const routeName = 'homeScreen';

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  HomeScreenCubit homeScreenCubit = HomeScreenCubit();
  TextEditingController? searchController = TextEditingController();

  var allCharacters = [];
  var allCharactersSerch = [];
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.myGrey,
      appBar: _buildAppBarActions(),
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        bloc: homeScreenCubit..getCharacters(),
        builder: (context, state) {
          if (state is HomeScreenLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.myYellow,
              ),
            );
          } else if (state is HomeScreenError) {
            if (state.massage == 'No Internet Connection') {
              return NoInternetScreen();
            } else {
              return Center(
                child: Text(
                  state.massage ?? '',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              );
            }
          } else if (state is HomeScreenLoaded) {
            allCharacters = state.characters.results!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                return CharacterItem(
                  character: searchController!.text.isNotEmpty
                      ? allCharactersSerch[index]
                      : allCharacters[index],
                );
              },
              itemCount: searchController!.text.isNotEmpty
                  ? allCharactersSerch.length
                  : allCharacters.length,
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      cursorColor: AppColor.myGrey,
      controller: searchController,
      onChanged: (text) {
        searchTextInList(text);
      },
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColor.myGrey,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: 'find your character...',
        hintStyle: TextStyle(
          color: AppColor.myGrey,
        ),
        border: InputBorder.none,
      ),
    );
  }

  //! Function Search
  void searchTextInList(String text) {
    allCharactersSerch = allCharacters.where((character) {
      return character.name!.toLowerCase().contains(text.toLowerCase());
    }).toList();
    setState(() {});
  }

  PreferredSizeWidget _buildAppBarActions() {
    if (isSearch) {
      // show search
      return AppBar(
        backgroundColor: AppColor.myYellow,
        title: _buildTextField(),
        actions: [
          IconButton(
            onPressed: () {
              searchController!.clear();
              setState(() {});
            },
            icon: Icon(Icons.clear),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            isSearch = false;
            setState(() {});
          },
          icon: Icon(Icons.arrow_back),
        ),
      );
    } else {
      return AppBar(
        actions: [
          IconButton(
            onPressed: () {
              isSearch = true;
              setState(() {});
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: const Text(
          "Characters",
          style: TextStyle(
            color: AppColor.myGrey,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.myYellow,
      );
    }
  }
}
