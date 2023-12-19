import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/category/category-item.dart';
import 'package:news/model/category.dart';

class CategoryFragment extends StatelessWidget {
  var categoryList = Category.getCategories();
  Function onCategoryClick;

  CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \n of interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //number of columns inside row
                mainAxisSpacing: 18, //vertical
                crossAxisSpacing: 18, //horizontal
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categoryList[index]);
                  },
                  child:
                      CategoryItem(category: categoryList[index], index: index),
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
