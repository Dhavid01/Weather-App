import 'package:flutter/material.dart';
import 'package:weather/utils/color.dart';
import 'package:weather/utils/text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:weather/views/search/component/cities_card.dart';
import 'package:weather/views/search/component/search_bar.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key, required this.city}) : super(key: key);

  final Map<String?, dynamic> city;
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var selectedIndex = 0;

  List<Map<dynamic, dynamic>> manageCitiesList = [];

  addCity() {
    manageCitiesList.add(widget.city);
  }

  @override
  void initState() {
    addCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: kLightestColor,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    AppText.heading(
                      "Search for City  ",
                      color: Colors.white,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: kLightestColor,
                        ),
                        child: const InkWell(
                          child: Icon(
                            Icons.more_vert_outlined,
                            color: Colors.transparent,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SearchBar()],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: GridView.custom(
                      gridDelegate: SliverStairedGridDelegate(
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 10,
                        pattern: const [
                          StairedGridTile(0.5, 1),
                          StairedGridTile(0.5, 1),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      selectedIndex = index;
                                    },
                                  );
                                },
                                child: CitiesCard(
                                  name: manageCitiesList[index]["name"],
                                  condition: manageCitiesList[index]
                                      ["condition"],
                                  temp: manageCitiesList[index]["temp"],
                                  color: index == selectedIndex
                                      ? kLightestColor
                                      : kLighterColor.withOpacity(0.3),
                                ),
                              ),
                          childCount: manageCitiesList.length),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
