import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/screens/add_new_product_screen.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_input_fields.dart';
import 'package:sell_product/widgets/rounded_button.dart';
import 'package:sell_product/widgets/small_text.dart';

class ImportProductScreen extends StatefulWidget {
  const ImportProductScreen({Key? key}) : super(key: key);

  @override
  State<ImportProductScreen> createState() => _ImportProductScreenState();
}

class _ImportProductScreenState extends State<ImportProductScreen> {
  String? _importdropdownValue;
  var _importamount = '1';
  String? importForm;
  String _importPrice = '10000';
  final _formkey = GlobalKey<FormState>();

  var title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'ນຳເຂົ້າສິນຄ້າ',
          color: AppColor.textColorwhite,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return AddNewProductScreen();
                }));
              },
              icon: Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            _dropdownName(),
            SizedBox(
              height: 15,
            ),
            _showPrice(),
            SizedBox(
              height: 15,
            ),
            _importForm(),
            SizedBox(
              height: 10,
            ),
            _importbutton()
          ],
        ),
      ),
    );
  }

  Widget _dropdownName() {
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
          value: _importdropdownValue,
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
              _importdropdownValue = _value;
            });
          }),
    );
  }

  Widget _importForm() {
    return Container(
      height: 170,
      width: 370,
      child: Form(
        key: _formkey,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFormFieldDefault(
                  initialValue: _importamount,
                  onsave: (_value) {
                    setState(() {
                      _importamount = _value;
                    });
                  },
                  hintText: 'ໃສ່ຈຳນວນທີ່ຈະນຳເຂົ້າ',
                  labelText: 'ຈຳນວນ',
                  validator: RequiredValidator(errorText: 'ກະລຸນາໃສ່ຈຳນວນ'),
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.none,
                    onsave: (_value) {
                      setState(() {
                        importForm = _value;
                      });
                    },
                    hintText: 'ໃສ່ຊື່ແມ່ທີມ',
                    labelText: 'ແມ່ທີມ',
                    validator:
                        RequiredValidator(errorText: 'ກະລຸນາໃສ່ຊື່ແມ່ທີມ'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              )
            ]),
      ),
    );
  }

  Widget _importbutton() {
    return RoundedButton(
        name: 'ນຳເຂົ້າສິນຄ້າ',
        height: 60,
        width: 200,
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            if (_importdropdownValue == null) {
              Fluttertoast.showToast(
                  msg: 'ກະລຸນາເລືອກລາຍການທີ່ຈະນຳເຂົ້າ',
                  gravity: ToastGravity.TOP);
            } else {
              _formkey.currentState!.save();
              print(_importdropdownValue);
              print(_importPrice);
              print(_importamount);
              title = int.parse(_importPrice) * int.parse(_importamount);

              print('ຈຳນວນເງີນ: ${title}');
              _formkey.currentState!.reset();
            }
          }
        });
  }

  Widget _showPrice() {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [BigText(text: 'ລາຄາ​: '), BigText(text: '$_importPrice')],
      ),
    );
  }
}
