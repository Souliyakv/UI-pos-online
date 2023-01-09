import 'package:flutter/material.dart';

import 'package:sell_product/screens/all_bangle_screen.dart';
import 'package:sell_product/screens/history_import_sereen.dart';
import 'package:sell_product/screens/history_sell_and_import.dart';
import 'package:sell_product/screens/history_sell_screen.dart';
import 'package:sell_product/screens/reserve_screen.dart';
import 'package:sell_product/widgets/custom_list_view_tiles.dart';

class AllHistoryScreen extends StatefulWidget {
  const AllHistoryScreen({Key? key}) : super(key: key);

  @override
  State<AllHistoryScreen> createState() => _AllHistoryScreenState();
}

class _AllHistoryScreenState extends State<AllHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        CustomListViewHistory(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return HistorySellScreen();
              }));
            },
            colorBox: Colors.green,
            icon: Icons.sell,
            texttitle: 'ປະຫວັດການຂາຍ'),
        CustomListViewHistory(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return HistoryImportScreen();
              }));
            },
            colorBox: Colors.pink,
            icon: Icons.import_export,
            texttitle: 'ປະຫວັດການນຳເຂົ້າ'),
        CustomListViewHistory(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return HistorySellAndImport();
              }));
            },
            colorBox: Colors.orange,
            icon: Icons.work_history_sharp,
            texttitle: 'ປະຫວັດຊຶ້ຂາຍທັງໝົດ'),
        CustomListViewHistory(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AllBangleScreen();
              }));
            },
            colorBox: Colors.blue,
            icon: Icons.monetization_on,
            texttitle: 'ກຳໄລທັງໝົດ'),
        CustomListViewHistory(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ReserveScreen();
              }));
            },
            colorBox: Colors.purple,
            icon: Icons.bookmark_add_rounded,
            texttitle: 'ການຈອງທັງໝົດ')
      ],
    ));
  }
}
