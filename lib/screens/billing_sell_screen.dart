import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/models/addproducttocatalog.dart';
import 'package:sell_product/providers/addproducttocatalog_provider.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_list_view_tiles.dart';
import 'package:sell_product/widgets/rounded_image.dart';
import 'package:sell_product/widgets/small_text.dart';

class BillingSellScreen extends StatefulWidget {
  const BillingSellScreen({Key? key}) : super(key: key);

  @override
  State<BillingSellScreen> createState() => _BillingSellScreenState();
}

class _BillingSellScreenState extends State<BillingSellScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: BigText(
              text: 'ການຂາຍສຳເຫຼັດແລ້ວ',
            ),
          )),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(
            text: ' ID: hj0otu89q0UeOMPLFw8Y60lQcLb2',
            color: Colors.black,
            size: 15,
          ),
          _allDataDetails(),
          _totalPrice(),
          _closeButton()
        ],
      ),
    );
  }

  Widget _allDataDetails() {
    List<AddDataShopperToBilling> data1 =
        Provider.of<AddDataShopperToBillingProvider>(context)
            .getAddDataShopperToBilling();
    return Container(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _datailsBillingperson(),
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data1.length,
                itemBuilder: (context, int index2) {
                  return Text(
                      '--------------------${data1[index2].dateTime}-------------------------');
                }),
            _showListMenu(),
          ],
        ),
      ),
    );
  }

  Widget _datailsBillingperson() {
    return Container(
      height: 120,
      child: Row(
        children: [
          _detailsBillingSeller(),
          _detailsBillingLogo(),
          _detailsBillingShopper()
        ],
      ),
    );
  }

  Widget _detailsBillingSeller() {
    return Container(
      width: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SmallText(
            text: ' ຈາກ',
            color: Colors.black,
            size: 18,
          ),
          SizedBox(
            height: 10,
          ),
          SmallText(
            text: ' ຊື່: ນ້ຳສົ້ມ',
            color: Colors.black,
            size: 15,
          ),
          SizedBox(
            height: 5,
          ),
          SmallText(
            text: ' ເບີ: 97434595',
            color: Colors.black,
            size: 15,
          ),
        ],
      ),
    );
  }

  Widget _detailsBillingLogo() {
    return Container(
      width: 110,
      child: RoundedImage(
        imagePath:
            'https://i.pinimg.com/550x/c7/30/2b/c7302b7d26d0e90199a3e7401a32056a.jpg',
        size: 110,
      ),
    );
  }

  Widget _detailsBillingShopper() {
    List<AddDataShopperToBilling> data1 =
        Provider.of<AddDataShopperToBillingProvider>(context)
            .getAddDataShopperToBilling();

    return ListView.builder(
        itemCount: data1.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index1) {
          return Container(
            width: 140,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmallText(
                  text: 'ຫາ',
                  color: Colors.black,
                  size: 18,
                ),
                SmallText(
                  text: 'ຊື່: ${data1[index1].nameShopper}',
                  color: Colors.black,
                  size: 14,
                ),
                SmallText(
                  text: 'ເບີ: ${data1[index1].phoneShopper}',
                  color: Colors.black,
                  size: 14,
                ),
                SmallText(
                  text: 'ສົ່ງ: ${data1[index1].sentPlace}',
                  color: Colors.black,
                  size: 12,
                ),
              ],
            ),
          );
        });
  }

  Widget _showListMenu() {
    List<AddProductToCatalog> data =
        Provider.of<AddProductToCatalogProvider>(context)
            .getAddProductToCatalog();
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, int index) {
          return CustomListViewTilesBilling(
            title: data[index].nameProduct as String,
            amoutn:
                '${NumberFormat("#####").format(data[index].amountProduct)} x ${NumberFormat("#,###,###,###.##").format(data[index].priceProduct)}',
          );
        });
  }

  Widget _totalPrice() {
    List<TotalPrice> data2 =
        Provider.of<TotalPriceProvider>(context).getTotalPrice();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            '      --------------------------------------------------------------------------------'),
        ListTile(
          title: BigText(
            text: 'ລວມ',
            size: 17,
          ),
          trailing: BigText(
            text:
                '${NumberFormat("#,###,###,###,###.##").format(data2[0].totalPrice)} ກີບ',
            size: 17,
          ),
        )
      ],
    );
  }

  Widget _closeButton() {
    return GestureDetector(
      onTap: () {
        var provider =
            Provider.of<AddProductToCatalogProvider>(context, listen: false);
        provider.clearList();
        var provider1 = Provider.of<AddDataShopperToBillingProvider>(context,
            listen: false);
        provider1.clearslistShopper();
        TotalPrice statement2 = TotalPrice(0);
        var provider2 = Provider.of<TotalPriceProvider>(context, listen: false);
        provider2.addTotalPrice(statement2);
        provider2.removeTotalPrice();

        Navigator.pop(context);
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        width: 395,
        color: Colors.blue,
        child: Center(
            child: BigText(
          text: 'ປິດ',
          color: AppColor.textColorwhite,
          size: 30,
        )),
      ),
    );
  }
}
