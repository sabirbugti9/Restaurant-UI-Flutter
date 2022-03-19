import 'package:flutter/material.dart';
import 'package:restaurant_app_ui/helper/app_colors.dart';
import 'package:restaurant_app_ui/helper/static_data.dart';

import '../../widgets/recommended_widget.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> restaurants;
  final int lowRate;

  const DetailsPage(
      {Key? key, required this.restaurants, required this.lowRate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 300,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  restaurants["image"],
                ),
              ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kwhiteColor,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurants["title"],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kblackColor,
                      ),
                    ),
                    MaterialButton(
                      shape: const StadiumBorder(),
                      onPressed: () {},
                      color: kPrimaryColor,
                      child: Text(
                        "OPEN",
                        style: TextStyle(color: kwhiteColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        restaurants["full_address"],
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: restaurants["star_count"],
                            itemBuilder: (ctx, index) {
                              return Icon(
                                Icons.star,
                                color: kPrimaryColor,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: lowRate,
                            itemBuilder: (ctx, index) {
                              return Icon(
                                Icons.star_border,
                                color: kAccentColor,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  restaurants["description"],
                  style: TextStyle(
                    color: kGreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MEMU",
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
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: menu.length,
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:const EdgeInsets.only(bottom: 12.0),
                          child: RecommendedWidget(
                            restaurants: menu[index],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
