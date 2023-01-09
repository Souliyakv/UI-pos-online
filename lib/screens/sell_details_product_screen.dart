import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/models/addproducttocatalog.dart';
import 'package:sell_product/providers/addproducttocatalog_provider.dart';
import 'package:sell_product/screens/billing_sell_screen.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_input_fields.dart';
import 'package:sell_product/widgets/custom_list_view_tiles.dart';
import 'package:sell_product/widgets/rounded_button.dart';

class SellDetailsProductScreen extends StatefulWidget {
  const SellDetailsProductScreen({Key? key}) : super(key: key);

  @override
  State<SellDetailsProductScreen> createState() =>
      _SellDetailsProductScreenState();
}

class _SellDetailsProductScreenState extends State<SellDetailsProductScreen> {
  String? _customerName;
  String? _customerPhone;
  String? _customerAddress;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BigText(
        text: 'ກະຕ່າຂອງຂ້ອຍ',
        color: AppColor.textColorwhite,
      )),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _detialsCatalog(),
          _amounttitle(),
          SizedBox(
            height: 10,
          ),
          _detailsCustomer(),
          SizedBox(
            height: 10,
          ),
          _selesconfirmButton()
        ],
      )),
    );
  }

  Widget _detialsCatalog() {
    List<AddProductToCatalog> data =
        Provider.of<AddProductToCatalogProvider>(context)
            .getAddProductToCatalog();
    List<TotalPrice> data2 =
        Provider.of<TotalPriceProvider>(context).getTotalPrice();

    return Card(
      elevation: 5,
      child: Container(
          height: 260,
          child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, int index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomListViewTiles(
                          title: data[index].nameProduct as String,
                          subtitle:
                              '${NumberFormat("#####").format(data[index].amountProduct)} x ${NumberFormat("#,###,###,###.##").format(data[index].priceProduct)}',
                          amount:
                              '${NumberFormat("#,###,###,###.##").format(data[index].totlePrice)}',
                          onTap: () {
                            var provider =
                                Provider.of<AddProductToCatalogProvider>(
                                    context,
                                    listen: false);

                            double resoulttotal =
                                data2[0].totalPrice! - data[index].totlePrice!;
                            TotalPrice statement2 = TotalPrice(resoulttotal);
                            var provider1 = Provider.of<TotalPriceProvider>(
                                context,
                                listen: false);
                            provider1.addTotalPrice(statement2);
                            provider1.removeTotalPrice();
                            provider.removeProductToCatalogs(0);
                          })
                    ],
                  ),
                );
              })),
    );
  }

  Widget _amounttitle() {
    /* List<AddProductToCatalog> data =
        Provider.of<AddProductToCatalogProvider>(context)
            .getAddProductToCatalog();*/
    List<TotalPrice> data2 =
        Provider.of<TotalPriceProvider>(context).getTotalPrice();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '  ລວມ: ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '${NumberFormat("#,###,###,###,###.##").format(data2[0].totalPrice)} ກີບ',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _detailsCustomer() {
    return Container(
      height: 250,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTextFormField(
                  textInputAction: TextInputAction.next,
                  onsave: (_value) {
                    setState(() {
                      _customerName = _value;
                    });
                  },
                  hintText: 'ໃສ່ຊື່ລູກຄ້າ',
                  labelText: 'ຊື່ລູກຄ້າ',
                  validator: RequiredValidator(errorText: 'ກະລຸນາໃສ່ຊື່ຜູ້ໃຊ້'),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  obscureText: false),
            ),
            Expanded(
              child: CustomTextFormField(
                  textInputAction: TextInputAction.next,
                  onsave: (_value) {
                    setState(() {
                      _customerPhone = _value;
                    });
                  },
                  hintText: 'ໃສ່ເບີລູກຄ້າ',
                  labelText: 'ເບີລູກຄ້າ',
                  validator: RequiredValidator(errorText: 'ກະລຸນາໃສ່ເບີຜູ້ໃຊ້'),
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  obscureText: false),
            ),
            Expanded(
              child: CustomTextFormField(
                  textInputAction: TextInputAction.done,
                  onsave: (_value) {
                    setState(() {
                      _customerAddress = _value;
                    });
                  },
                  hintText: 'ໃສ່ບ່ອນສົ່ງ',
                  labelText: 'ບ່ອນສົ່ງ',
                  validator: RequiredValidator(errorText: 'ກະລຸນາໃສ່ບ່ອນສົ່ງ'),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  obscureText: false),
            )
          ],
        ),
      ),
    );
  }

  Widget _selesconfirmButton() {
    List<AddProductToCatalog> data =
        Provider.of<AddProductToCatalogProvider>(context)
            .getAddProductToCatalog();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedButton(
            name: 'ຈອງສິນຄ້າ',
            height: 50,
            width: 150,
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
                for (var i = 0; i < data.length; i++) {
                  print(
                      "${data[i].nameProduct} : ${data[i].amountProduct} : ${data[i].priceProduct} : ${data[i].totlePrice}");
                }
                print(_customerName);
                print(_customerPhone);
                print(_customerAddress);
                Fluttertoast.showToast(
                    msg: 'ຂາຍສຳເຫຼັດ', gravity: ToastGravity.TOP);
              }
            }),
        RoundedButton(
            name: 'ຂາຍ ແລະ ພິມບິນ',
            height: 50,
            width: 150,
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                if (data.length == 0) {
                  Fluttertoast.showToast(
                      msg: 'ກະລຸນາເລືອກລາຍການທີ່ຈະຂາຍ',
                      gravity: ToastGravity.TOP);
                } else {
                  _formkey.currentState!.save();

                  var provider = Provider.of<AddDataShopperToBillingProvider>(
                      context,
                      listen: false);
                  provider.clearslistShopper();

                  AddDataShopperToBilling stament1 = AddDataShopperToBilling(
                      _customerName,
                      _customerPhone,
                      _customerAddress,
                      DateTime.now());
                  var provider1 = Provider.of<AddDataShopperToBillingProvider>(
                      context,
                      listen: false);
                  provider1.addAddDataShopperToBilling(stament1);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return BillingSellScreen();
                  }));
                }
              }
            }),
      ],
    );
  }
}
