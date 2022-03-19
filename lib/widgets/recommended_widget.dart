import 'package:flutter/material.dart';
import 'package:restaurant_app_ui/helper/app_colors.dart';

class RecommendedWidget extends StatefulWidget {
  final Map<String, dynamic> restaurants;
  const RecommendedWidget({Key? key, required this.restaurants})
      : super(key: key);

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  int lowRate = 0;
  @override
  void initState() {
    int rateValue = 5;
    setState(() {
      int starCount = widget.restaurants["star_count"];
      lowRate = rateValue - starCount;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image(
            height: 100,
            width: 130,
            fit: BoxFit.cover,
            image: AssetImage(
              widget.restaurants["image"],
            ),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Text(
              widget.restaurants["title"],
              style: TextStyle(
                color: kblackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              widget.restaurants["address"],
              style: TextStyle(
                color: kGreyColor,
                // fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            widget.restaurants["price"] == 14 ||
                    widget.restaurants["price"] == 12
                ? Text(
                    "\$${widget.restaurants["price"].toString()}",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.restaurants["star_count"],
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
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        widget.restaurants["reviews"].toString(),
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ],
    );
  }
}
