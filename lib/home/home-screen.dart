import 'package:flutter/material.dart';
import 'package:news/category/category-details.dart';
import 'package:news/category/category-fragments.dart';
import 'package:news/home/search/news-search-delegate.dart';
import 'package:news/my-Theme.dart';
import 'package:news/settings/settings-tab.dart';
import 'package:news/tabs/home-drawer.dart';

import '../model/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          )),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            selectedDrawerItem == HomeDrawer.settings
                ? 'Settings'
                : selectedCategory == null
                    ? 'News App'
                    : selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: NewsSearchDelegate()),
                icon: Icon(
                  Icons.search,
                  size: 30,
                )),
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(
            onDrawerItemClick: onDrawerItemClick,
          ),
        ),
        body: selectedDrawerItem == HomeDrawer.settings
            ? settingsTab()
            : selectedCategory == null
                ? CategoryFragment(onCategoryClick: onCategoryClick)
                : //reference
                CategoryDetails(category: selectedCategory!),
      ),
    ]);
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    //user will press on it
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
