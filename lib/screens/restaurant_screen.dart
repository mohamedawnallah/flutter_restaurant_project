import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/models.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({Key key, Restaurant inputRestaurant})
      : this.restaurant = inputRestaurant,
        super(key: key);

  Widget _topSectionRestaurantSection(context) {
    return Stack(
      children: [
        Hero(
          tag: Key(restaurant.imageUrl),
          child: Image(
            height: 220.0,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            image: AssetImage(
              restaurant.imageUrl,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: IconButton(
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
              SafeArea(
                child: IconButton(
                  iconSize: 30.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _infoRestaurantSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "0.2 miles away",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: List.generate(
              restaurant.rating,
              (index) => Text(
                "⭐️ ",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            restaurant.address,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Reviews"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Contact"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3)
                  ],
                  stops: [
                    0.3,
                    0.4,
                    0.7,
                    0.9
                  ]),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    menuItem.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    "\$${menuItem.price.toString()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
              right: 10,
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _menuItems(context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      crossAxisCount: 2,
      children: List.generate(
        restaurant.menu.length,
        (index) {
          Food foodInMenuItem = restaurant.menu[index];
          return _buildMenuItem(foodInMenuItem);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _topSectionRestaurantSection(context),
              _infoRestaurantSection(),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _menuItems(context),
            ],
          ),
        ),
      ),
    );
  }
}
