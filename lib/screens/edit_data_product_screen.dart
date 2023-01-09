import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/small_text.dart';

import '../widgets/custom_input_fields.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_image.dart';

class EditDataProductScreen extends StatefulWidget {
  const EditDataProductScreen({Key? key}) : super(key: key);

  @override
  State<EditDataProductScreen> createState() => _EditDataProductScreen();
}

class _EditDataProductScreen extends State<EditDataProductScreen> {
  String? _nameProduct;
  String? _amountProduct;
  String? _buyPrice;
  String? _sellProduct;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
          title: BigText(
        text: 'ແກ້ໄຂຂໍ້ມູນ',
        color: AppColor.textColorwhite,
      )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _allDataProduct(),
              SizedBox(
                height: 15,
              ),
              _addNewProductButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _allDataProduct() {
    return Container(
      height: 350,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    onsave: (_value) {
                      setState(() {
                        _nameProduct = _value;
                      });
                    },
                    hintText: 'ໃສ່ຊື່ສິນຄ້າຂອງເຈົ້າ',
                    labelText: 'ຊື່',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ຊື່ສິນຄ້າຂອງເຈົ້າ'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    onsave: (_value) {
                      setState(() {
                        _amountProduct = _value;
                      });
                    },
                    hintText: 'ໃສ່ຈຳນວນສິນຄ້າຂອງເຈົ້າ',
                    labelText: 'ຈຳນວນ',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ຈຳນວນສິນຄ້າຂອງເຈົ້າ'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    onsave: (_value) {
                      setState(() {
                        _buyPrice = _value;
                      });
                    },
                    hintText: 'ໃສ່ລາຄາຊື້ສິນຄ້າຂອງເຈົ້າ',
                    labelText: 'ລາຄາຊື້',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ລາຄາຊື້ສິນຄ້າຂອງເຈົ້າ'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.done,
                    onsave: (_value) {
                      setState(() {
                        _sellProduct = _value;
                      });
                    },
                    hintText: 'ໃສ່ລາຄາຂາຍສິນຄ້າຂອງເຈົ້າ',
                    labelText: 'ລາຄາຂາຍ',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ລາຄາຂາຍສິນຄ້າຂອງເຈົ້າ'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              )
            ],
          )),
    );
  }

  Widget _addNewProductButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedButton(
            name: 'ແກ້ໄຂຂໍ້ມູນ',
            height: 60,
            width: 150,
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
                print(_amountProduct);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: BigText(text: 'ແນ່ໃຈບໍທີ່ຕ້ອງການແກ້ໄຂຂໍ້ມູນ'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              print(_amountProduct);
                            },
                            child: SmallText(
                              text: 'ແກ້ໄຂຂໍ້ມູນ',
                              color: Colors.red,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: SmallText(
                                text: 'ຍົກເລີກ',
                                color: Colors.black,
                              ))
                        ],
                      );
                    });
              }
            }),
        SizedBox(
          width: 15,
        ),
        RoundedButtonDelete(
            name: 'ລິບຂໍ້ມູນ', height: 60, width: 130, onPressed: () {})
      ],
    );
  }
}
