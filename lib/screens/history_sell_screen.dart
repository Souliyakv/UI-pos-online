import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_list_view_tiles.dart';
import 'package:sell_product/widgets/small_text.dart';

class HistorySellScreen extends StatefulWidget {
  const HistorySellScreen({Key? key}) : super(key: key);

  @override
  State<HistorySellScreen> createState() => _HistorySellScreenState();
}

class _HistorySellScreenState extends State<HistorySellScreen> {
  DateTime firstdateTime = DateTime(2020, 01, 3);
  DateTime lastdateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'ປະຫວັດການຂາຍ',
          color: AppColor.textColorwhite,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Center(
          child: Column(
        children: [_selectBetweenDatetime(), _listData(), _totalPrice()],
      )),
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
              onPressed: () {},
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
      height: 480,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (context, int index) {
            return CustomListViewTilesHistorySell(
                title: '2022/08/10 02:11',
                subtitle: 'ບຸນສະຫວັນ',
                amount: '10,000,000',
                bangle: '50,000',
                onTap: () {});
          }),
    );
  }

  Widget _totalPrice() {
    return Container(
      height: 100,
      child: Column(
        children: [
          Text(
              '---------------------------------------------------------------------------------------------'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: 'ລວມ:',
                size: 20,
              ),
              Column(
                children: [
                  SmallText(
                    text: '10,000,000 ກີບ',
                    color: Colors.black,
                    size: 15,
                  ),
                  SmallText(
                    text: 'ກຳໄລ:50,000 ກີບ',
                    color: Colors.green,
                    size: 14,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: 'ລວມ:',
                size: 20,
              ),
              Column(
                children: [
                  SmallText(
                    text: '0 ບາດ',
                    color: Colors.black,
                    size: 15,
                  ),
                  SmallText(
                    text: '0 ບາດ',
                    color: Colors.green,
                    size: 14,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
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
