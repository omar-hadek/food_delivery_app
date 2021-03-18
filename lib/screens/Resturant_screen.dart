import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:flutter_application_1/widgets/rating_stars.dart';

class ResturantScreen extends StatefulWidget {
  final Restaurant restaurant;
  ResturantScreen({this.restaurant});
  @override
  _ResturantScreenState createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  _BuildMenuFood(Food menuItem) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 170.0,
              width: 170.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(menuItem.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Container(
              height: 170.0,
              width: 170.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3)
                  ],
                  stops: [0.1, 0.4, 0.6, 0.9],
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Positioned(
              bottom: 64.0,
              child: Column(
                children: [
                  Text(
                    menuItem.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    '\$${menuItem.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '2.0 miles away',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  RatingStars(widget.restaurant.rating),
                  Text(
                    widget.restaurant.address,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        onPressed: () {},
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        onPressed: () {},
                        child: Text(
                          'Contact',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      physics: BouncingScrollPhysics(),
                      children:
                          List.generate(widget.restaurant.menu.length, (index) {
                        Food food = widget.restaurant.menu[index];
                        return _BuildMenuFood(food);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
