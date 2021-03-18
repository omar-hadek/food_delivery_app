import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _BuildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 130.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.food.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            order.restaurant.name,
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.black87,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                Text(
                                  order.quantity.toString(),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$${order.food.price}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalprice = 0;
    currentUser.cart.forEach((Order order) {
      totalprice += order.quantity * order.food.price;
    });
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart (${currentUser.cart.length})',
          ),
        ),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _BuildCartItem(order);
          } else {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimated Dilevery Time :',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '25 min',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Cost :',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$${totalprice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100.0),
                ],
              ),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey[700],
          );
        },
        itemCount: currentUser.cart.length + 1,
      ),
      bottomSheet: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'CHECKOUT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
