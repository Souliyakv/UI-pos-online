import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/screens/all_history_screen.dart';
import 'package:sell_product/screens/data_product_screen.dart';
import 'package:sell_product/screens/login_screen.dart';
import 'package:sell_product/screens/my_profile_screen.dart';
import 'package:sell_product/screens/sell_product_screen.dart';
import 'package:sell_product/widgets/big_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyProfileScreen();
                  }));
                },
                icon: Icon(Icons.person))
          ],
          title: BigText(
            text: 'Shop',
            color: Colors.white,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "ຂາຍ",
              ),
              Tab(
                text: "ຂໍ້ມູນສິນຄ້າ",
              ),
              Tab(
                text: "ປະຫວັດຕ່າງໆ",
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          SellProductScreen(),
          DataProductScreen(),
          AllHistoryScreen()
        ]),
      ),
    );
  }
}
