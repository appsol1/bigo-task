import 'package:bigo_task/globals.dart';
import 'package:bigo_task/models/HomeModel.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  HomeModel homeModel;

  HomeCard(this.homeModel);

  @override
  Widget build(BuildContext context) {
    var imgSrc = homeModel.getImageUrl();
    // "https://www.development-q5nzhaa-sb26hc2y3xm26.uk-1.platformsh.site/uploads/thumbnail_pexels_photo_106399_261e005913.jpeg";

    return Container(
      width: 230,
      margin: EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: globals.grayColor)]),
      child: Column(
        children: [
          Stack(
            // fit: StackFit.expand,
            children: [
              /*Positioned.fill(
                child:*/
              imgSrc.isEmpty
                  ? ColoredBox(
                      color: globals.secondryColor,
                      child: SizedBox(
                        width: double.infinity,
                        height: 150,
                      ))
                  : Image.network(
                      imgSrc,
                      // imgSrc,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              /*),*/
              Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: globals.grayColor)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          color: globals.grayColor,
                        ),
                        iconSize: 20,
                        constraints: BoxConstraints(minWidth: 40, minHeight: 40),
                        padding: EdgeInsets.zero,
                      )))
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  homeModel.price as String,
                  style: TextStyle(color: globals.appMainColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 15),
                Text(homeModel.getTimeDiff(), style: TextStyle(color: globals.grayColor))
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.place_outlined, color: globals.grayColor, size: 18),
                Text(
                  homeModel.location!,
                  style: TextStyle(color: globals.grayColor),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.format_shapes, color: globals.grayColor, size: 16),
                    Text('1,618 ft', style: TextStyle(color: globals.grayColor))
                  ],
                ),
                Spacer(),
                Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.king_bed_outlined, color: globals.grayColor, size: 18),
                    Text(homeModel.beds!, style: TextStyle(color: globals.grayColor, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 10),
                Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.bathtub_outlined, color: globals.grayColor, size: 16),
                    Text(homeModel.baths!, style: TextStyle(color: globals.grayColor, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
