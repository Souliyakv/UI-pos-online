import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/rounded_image.dart';

class CustomListViewTiles extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final Function onTap;
  const CustomListViewTiles(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.amount,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        trailing: Column(
          children: [Text("ລວມ: ${amount} ກີບ"), Text('ກຳໄລ: 2,000 ກີບ')],
        ),
        leading: GestureDetector(
          onTap: () => onTap(),
          child: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class CustomListViewTilesDataProduct extends StatelessWidget {
  final String title;
  final String subtitle;

  final Function onTap;
  final String amoutn;
  const CustomListViewTilesDataProduct(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.amoutn,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          'ຈຳນວນ ${amoutn} ອັນ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
          onTap: () => onTap(),
          child: Icon(
            Icons.edit,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class CustomListViewTilesBilling extends StatelessWidget {
  final String title;

  final String amoutn;
  const CustomListViewTilesBilling({
    Key? key,
    required this.title,
    required this.amoutn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        '${amoutn} ກີບ',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }
}

class CustomListViewHistory extends StatelessWidget {
  final Function onTap;
  final Color? colorBox;
  final IconData? icon;
  final String? texttitle;

  const CustomListViewHistory(
      {Key? key,
      required this.onTap,
      required this.colorBox,
      required this.icon,
      required this.texttitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colorBox),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            BigText(
              text: '$texttitle',
              size: 18,
              color: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}

class CustomListViewTilesHistorySell extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final Function onTap;
  final String? bangle;
  const CustomListViewTilesHistorySell(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.amount,
      required this.onTap,
      required this.bangle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        trailing: Column(
          children: [Text("ລວມ: ${amount} ກີບ"), Text('ກຳໄລ: ${bangle} ກີບ')],
        ),
      ),
    );
  }
}

class CustomListViewTilesHistoryImport extends StatelessWidget {
  final String title;
  final String subtitle;
  final String totalPrice;
  final Function onTap;
  final String? nameProduct;
  final String? amount;
  const CustomListViewTilesHistoryImport(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.totalPrice,
      required this.onTap,
      required this.nameProduct,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          'ຈາກ: ${subtitle}',
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        trailing: Column(
          children: [Text("ລວມ: ${totalPrice} ກີບ"), Text('${nameProduct}')],
        ),
        leading: CircleAvatar(
          child: Text('${amount}'),
        ),
      ),
    );
  }
}

class CustomListViewTilesBangle extends StatelessWidget {
  final String title;
  final String? amount;
  final String totalPrice;

  final String? nameProduct;

  const CustomListViewTilesBangle({
    Key? key,
    required this.title,
    required this.amount,
    required this.totalPrice,
    required this.nameProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Column(
          children: [Text("${totalPrice} ກີບ"), Text('${nameProduct} ບາດ')],
        ),
        subtitle: Text('ຈຳນວນ ${amount}'),
      ),
    );
  }
}
