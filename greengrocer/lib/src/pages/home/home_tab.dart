import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/home/components/category_tile.dart';
import 'package:greengrocer/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30.0),
            children: [
              TextSpan(
                text: "Green",
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: "grocer",
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: "Pesquise aqui...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14.0,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  )),
            ),
          ),
          // Categorias
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            height: 40.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                  onPressed: () {
                    setState(() {
                      selectedCategory = appData.categories[index];
                    });
                  },
                );
              },
              separatorBuilder: (_, index) => const SizedBox(
                width: 10,
              ),
              itemCount: appData.categories.length,
            ),
          ),
          // Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 9.0 / 11.5,
              ),
              itemBuilder: (_, index) {
                return ItemTile(
                  item: appData.items[index],
                );
              },
              itemCount: appData.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
