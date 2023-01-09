import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_list_view_tiles.dart';

class HistorySellAndImport extends StatefulWidget {
  const HistorySellAndImport({Key? key}) : super(key: key);

  @override
  State<HistorySellAndImport> createState() => _HistorySellAndImportState();
}

class _HistorySellAndImportState extends State<HistorySellAndImport> {
  DateTime firstdateTime = DateTime(2020, 01, 3);
  DateTime lastdateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'ກຳໄລທັງໝົດ',
          color: AppColor.textColorwhite,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Center(
        child: Column(children: [_selectBetweenDatetime(), _listData()]),
      ),
    );
  }

  Widget _selectBetweenDatetime() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () async {
                final firstdate = await firstpickDate();
                if (firstdate == null) return;
                setState(() {
                  firstdateTime = firstdate;
                });
              },
              child: Text(
                  '${firstdateTime.year}/${firstdateTime.month}/${firstdateTime.day}')),
          Text('ຫາ'),
          ElevatedButton(
              onPressed: () async {
                final lastdate = await lastpickDate();
                if (lastdate == null) return;
                setState(() {
                  lastdateTime = lastdate;
                });
              },
              child: Text(
                  '${lastdateTime.year}/${lastdateTime.month}/${lastdateTime.day}')),
          IconButton(
              onPressed: () {
                print('${firstdateTime} to ${lastdateTime}');
              },
              icon: Icon(
                Icons.search,
                color: Colors.green,
              ))
        ],
      ),
    );
  }

  Widget _listData() {
    return Container(
      height: 580,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, int index) {
            return Card(
              child: ListTile(
                title: Text("ຄິມ"),
                trailing: Column(children: [
                  Text('ຊື້ 10,000 ຊິ້ນ'),
                  Text('ຂາຍ 5,000 ຊີ້ນ')
                ]),
              ),
            );
          }),
    );
  }

  Future<DateTime?> firstpickDate() => showDatePicker(
      context: context,
      initialDate: firstdateTime,
      firstDate: DateTime(2010),
      lastDate: DateTime.now());

  Future<DateTime?> lastpickDate() => showDatePicker(
      context: context,
      initialDate: lastdateTime,
      firstDate: DateTime(2019),
      lastDate: DateTime.now());
}
