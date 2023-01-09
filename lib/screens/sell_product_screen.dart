import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:sell_product/models/addproducttocatalog.dart';
import 'package:sell_product/providers/addproducttocatalog_provider.dart';
import 'package:sell_product/screens/sell_details_product_screen.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_input_fields.dart';

import 'package:sell_product/widgets/rounded_button.dart';
import 'package:sell_product/widgets/small_text.dart';

class SellProductScreen extends StatefulWidget {
  const SellProductScreen({Key? key}) : super(key: key);

  @override
  State<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
  late double _deviceHeight;
  late double _deviceWidth;
  var _amount = '1';
  final _formkey = GlobalKey<FormState>();
  final _formkey1 = GlobalKey<FormState>();
  var _sellPrice = '10000';

  String? _selldropdownValue;
  String? _changePrice;
  double? amountCatalog;
  double allTotal = 0;

  var total;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    List<AddProductToCatalog> data =
        Provider.of<AddProductToCatalogProvider>(context)
            .getAddProductToCatalog();
    amountCatalog = data.length - 1;
    if (amountCatalog == -1) {
      return _buildUINull();
    } else {
      return _buildUI();
    }
  }

  Widget _buildUI() {
    List<AddProductToCatalog> data =
        Provider.of<AddProductToCatalogProvider>(context)
            .getAddProductToCatalog();
    return Scaffold(
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          Text(
            '${data.length}',
            style: TextStyle(color: Colors.red),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return SellDetailsProductScreen();
              }));
            },
            child: Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            _selldropdownName(),
            _displayAndEditPrice(),
            SizedBox(
              height: _deviceHeight * 0.01,
            ),
            _sellAmount(),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            _sellToCatalogButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUINull() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            _selldropdownName(),
            _displayAndEditPrice(),
            SizedBox(
              height: _deviceHeight * 0.01,
            ),
            _sellAmount(),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            _sellToCatalogButton()
          ],
        ),
      ),
    );
  }

  Widget _selldropdownName() {
    return Container(
      width: 370,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1)),
      child: DropdownButton(
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          isExpanded: true,
          value: _selldropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          items: <String>['ເສື້ອ', 'ກາງເກງ', 'ເກີບ']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? _value) {
            setState(() {
              _selldropdownValue = _value;
            });
          }),
    );
  }

  Widget _displayAndEditPrice() {
    return ListTile(
      title: BigText(
        text: 'ລາຄາ:',
        color: Colors.black,
      ),
      trailing: GestureDetector(
        onTap: () {
          _showModalBottomSheetPrice();
        },
        child: Icon(
          Icons.edit,
          color: Colors.red,
        ),
      ),
      subtitle: SmallText(
        text: '${_sellPrice} ກີບ',
        color: Colors.black,
        size: 15,
      ),
    );
  }

  Widget _sellAmount() {
    return Container(
      padding: EdgeInsets.only(
          left: _deviceWidth * 0.03, right: _deviceWidth * 0.03),
      child: Form(
        key: _formkey,
        child: CustomTextFormFieldDefault(
            initialValue: _amount,
            onsave: (_value) {
              setState(() {
                _amount = _value;
              });
            },
            hintText: 'ໃສ່ຈຳນວນທີ່ຂາຍ',
            labelText: 'ຈຳນວນ',
            validator: RequiredValidator(errorText: 'ກະລຸນາໃສ່່ຈຳນວນທີ່ຂາຍ'),
            keyboardType: TextInputType.number,
            autofocus: false,
            obscureText: false),
      ),
    );
  }

  Widget _sellToCatalogButton() {
    List<TotalPrice> data2 =
        Provider.of<TotalPriceProvider>(context).getTotalPrice();
    return RoundedButton(
        name: 'ເພີ່ມລົງໃນລາຍການ',
        height: _deviceHeight * 0.08,
        width: _deviceWidth * 0.65,
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            if (_selldropdownValue == null) {
              Fluttertoast.showToast(
                  msg: 'ກະລຸນາເລືອກລາຍການທີ່ຈະຂາຍ',
                  gravity: ToastGravity.TOP,
                  textColor: Colors.red,
                  backgroundColor: Colors.white);
            } else {
              if (data2.length == 0) {
                _formkey.currentState!.save();
                total = double.parse(_sellPrice) * double.parse(_amount);
                print('null');
                print(total);
                TotalPrice statement2 = TotalPrice(total);
                var provider1 =
                    Provider.of<TotalPriceProvider>(context, listen: false);
                provider1.addTotalPrice(statement2);

                AddProductToCatalog statement = AddProductToCatalog(
                    _selldropdownValue,
                    double.parse(_sellPrice),
                    double.parse(_amount),
                    total);
                var provider = Provider.of<AddProductToCatalogProvider>(context,
                    listen: false);
                provider.addAddProductToCatalog(statement);
                Fluttertoast.showToast(
                    msg: 'ເພີ່ມເຂົ້າໃນລາຍການແລ້ວ', gravity: ToastGravity.TOP);
              } else {
                _formkey.currentState!.save();

                total = double.parse(_sellPrice) * double.parse(_amount);
                var allTotal = data2[0].totalPrice;

                allTotal = allTotal! + total;
                TotalPrice statement2 = TotalPrice(allTotal);
                var provider1 =
                    Provider.of<TotalPriceProvider>(context, listen: false);
                provider1.addTotalPrice(statement2);

                provider1.removeTotalPrice();

                print(allTotal);
                print(data2.length);

                AddProductToCatalog statement = AddProductToCatalog(
                    _selldropdownValue,
                    double.parse(_sellPrice),
                    double.parse(_amount),
                    total);
                var provider = Provider.of<AddProductToCatalogProvider>(context,
                    listen: false);
                provider.addAddProductToCatalog(statement);
                Fluttertoast.showToast(
                    msg: 'ເພີ່ມເຂົ້າໃນລາຍການແລ້ວ', gravity: ToastGravity.TOP);
              }
            }
          }
        });
  }

  void _showModalBottomSheetPrice() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formkey1,
                  child: CustomTextFormFieldDefault(
                      initialValue: _sellPrice,
                      onsave: (_valeu) {
                        setState(() {
                          _changePrice = _valeu;
                        });
                      },
                      hintText: 'ໃສ່ລາຄາໃໝ່ຂອງເຈົ້າ',
                      labelText: 'ລາຄາໃໝ່',
                      validator: RequiredValidator(
                          errorText: "ກະລຸນາໃສ່ລາຄາໃໝ່ຂອງເຈົ້າ"),
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      obscureText: false),
                ),
                Container(
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: SmallText(
                            text: 'ຍົກເລີກ',
                            color: Colors.black,
                          )),
                      TextButton(
                          onPressed: () {
                            _showDialogChangePrice();
                          },
                          child: SmallText(
                            text: 'ບັນທຶກ',
                            color: Colors.blue,
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void _showDialogChangePrice() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: BigText(text: 'ແນ່ໃຈບໍ່ທີ່ຕ້ອງການປ່ຽນລາຄາ'),
            content: SmallText(
              text:
                  'ລາຄາຈະຖືກປ່ຽນແປງສະເພາະລາຍການນິ້ ຖ້າຕ້ອງການຢາກໃຫ້ປ່ຽນແປງທຸກຄັ້ງໄປທີ່:-> ຂໍ້ມູນສິນຄ້າ -> ກົດໃສ່ໄອຄອນແກ້ໄຂ -> ແລ້ວໃສ່ຂໍ້ມູນໃໝ່',
              color: Colors.black,
              size: 15,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('ຍົກເລີກ')),
              TextButton(
                onPressed: () {
                  if (_formkey1.currentState!.validate()) {
                    _formkey1.currentState!.save();
                    setState(() {
                      _sellPrice = _changePrice!;
                    });
                    print(_changePrice);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "ປ່ຽນລາຄາ",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          );
        });
  }
}
