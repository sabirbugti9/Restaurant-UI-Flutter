import 'package:flutter/material.dart';
import 'package:restaurant_app_ui/helper/app_colors.dart';
import 'package:restaurant_app_ui/helper/static_data.dart';
import 'package:restaurant_app_ui/widgets/recommended_widget.dart';

import '../../widgets/selection_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: height / 3.2,
            width: width,
            color: kPrimaryColor,
            child: Column(children: [
              const Spacer(),
              Text(
                "Where do you want\nto eat tonight?",
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                // width: width / 1.8,
                height: 35,
                margin: EdgeInsets.symmetric(horizontal: width / 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kAccentColor,
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: kwhiteColor,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ]),
          ),
          Container(
            height: height / 1.1,
            width: width,
            decoration: BoxDecoration(
              color: kwhiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height / 14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SELECTION",
                        style: TextStyle(
                          color: kblackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: kGreyColor,
                          // fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: selectionData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: width / 20, right: 12.0),
                          child: SelectionWidget(
                            restaurants: selectionData[index],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RECOMMENDED",
                        style: TextStyle(
                          color: kblackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: kGreyColor,
                          // fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recommended.length,
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: width / 20, bottom: 12.0),
                          child: RecommendedWidget(
                            restaurants: recommended[index],
                          ),
                        );
                      }),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [

                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
